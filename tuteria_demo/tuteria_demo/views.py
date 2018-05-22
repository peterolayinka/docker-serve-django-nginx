from django.http import HttpResponse
from django.template import loader

def index(request):
    template = loader.get_template('demo/index.html')
    context = {
      'index': {
        'text': 'Hello, templated world!'
      }
    }
    return HttpResponse(template.render(context, request))
