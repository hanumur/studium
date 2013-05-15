package com.arturoherrero

import spock.lang.Specification

@TestFor(ProjectController)
@Mock(Project)
class ProjectControllerSpec extends Specification {

    def "index action redirects to list action"() {
        when:
        controller.index()

        then:
        response.redirectedUrl == '/project/list'
    }

    def "test list action"() {
        when:
        controller.list()

        then:
        view == '/project/list'
        model.projectInstanceList.size() == 0
    }

    def "test create action"() {
        when:
        controller.create()

        then:
        model.projectInstance != null
    }

    def "save a project without params"() {
        when:
        controller.save()

        then:
        model.projectInstance != null
        view == '/project/create'
    }

    def "save a project"() {
        given:
        populateValidParams(params)
        assert Project.count() == 0

        when:
        controller.save()

        then:
        Project.count() == 1
        response.redirectedUrl == '/project/show/1'
        flash.message != null
    }

    def "show a project"() {
        given:
        def project = new Project(projectValidProperties).save()

        when:
        params.id = project.id
        controller.show()

        then:
        view == '/project/show'
        model.projectInstance == project
    }

    def "edit a project not founded"() {
        when:
        controller.edit()

        then:
        flash.message != null
        response.redirectedUrl == '/project/list'
    }

    def "edit a project"() {
        given:
        def project = new Project(projectValidProperties).save()

        when:
        params.id = project.id
        controller.edit()

        then:
        view == '/project/edit'
        model.projectInstance == project
    }

    def "update a project successfully"() {
        given:
        def project = new Project(projectValidProperties).save()
        assert project.techLead == 'Arturo Herrero'

        when:
        params.id = project.id
        params.techLead = 'Arturo'
        controller.update()

        then:
        project.techLead == 'Arturo'
    }

    def "delete a project"() {
        given:
        def project = new Project(projectValidProperties).save()
        assert Project.count() == 1

        when:
        params.id = project.id
        controller.delete()

        then:
        Project.count() == 0
        response.redirectedUrl == '/project/list'
    }

    private populateValidParams(params) {
        params.with {
            name = 'Test Project'
            code = '0001'
            techLead = 'Arturo Herrero'
            manager = 'Arturo Herrero'
            delivery = new Date()
            priority = 1
        }
    }

    private projectValidProperties = [
        name: 'Test Project',
        code: '0001',
        techLead: 'Arturo Herrero',
        manager: 'Arturo Herrero',
        delivery: new Date(),
        priority: 1
    ]

    /*def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/project/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.projectInstanceList.size() == 0
        assert model.projectInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.projectInstance != null
    }

    void testSave() {
        controller.save()

        assert model.projectInstance != null
        assert view == '/project/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/project/show/1'
        assert controller.flash.message != null
        assert Project.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/project/list'

        populateValidParams(params)
        def project = new Project(params)

        assert project.save() != null

        params.id = project.id

        def model = controller.show()

        assert model.projectInstance == project
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/project/list'

        populateValidParams(params)
        def project = new Project(params)

        assert project.save() != null

        params.id = project.id

        def model = controller.edit()

        assert model.projectInstance == project
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/project/list'

        response.reset()

        populateValidParams(params)
        def project = new Project(params)

        assert project.save() != null

        // test invalid parameters in update
        params.id = project.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/project/edit"
        assert model.projectInstance != null

        project.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/project/show/$project.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        project.clearErrors()

        populateValidParams(params)
        params.id = project.id
        params.version = -1
        controller.update()

        assert view == "/project/edit"
        assert model.projectInstance != null
        assert model.projectInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/project/list'

        response.reset()

        populateValidParams(params)
        def project = new Project(params)

        assert project.save() != null
        assert Project.count() == 1

        params.id = project.id

        controller.delete()

        assert Project.count() == 0
        assert Project.get(project.id) == null
        assert response.redirectedUrl == '/project/list'
    }*/
}
