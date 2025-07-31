What is fTable
==============

FTable is a clean, vanilla JavaScript rewrite of the popular `jTable` plugin, designed for modern web apps.

✅ No dependencies  
✅ Dynamic forms & async fields  
✅ Localization  
✅ Responsive  
✅ MIT Licensed  

## Screenshots
[![A screenshot of fTable](https://raw.githubusercontent.com/liedekef/ftable/master/screenshot.png)](https://github.com/liedekef/ftable/)
[![Other screenshot, used in Events Made Easy](https://raw.githubusercontent.com/liedekef/ftable/master/screenshot2.png)](https://github.com/liedekef/ftable/)

FTable is a clean, vanilla JavaScript rewrite of the popular `jTable` plugin, designed for modern web apps.

### Features
✅ Create, Read, Update, Delete  
✅ Sorting, Paging, Filtering  
✅ Dynamic dependent fields  
✅ Ajax loading for data and options  
✅ Localization via JTable.setMessages(...)  
✅ Modal forms  
✅ CSV export, Print  
✅ User preferences (localStorage)  

## Install

```bash
npm install @liedekef/ftable
```

## Usage

As a standalone script:
```JS
<link href="ftable/themes/lightcolor/gray/ftable.css" rel="stylesheet">
<script src="js/ftable/ftable.js"></script>

const table = new FTable('#table', {
  actions: {
    listAction: '/api/users',
    createAction: '/api/users/add',
    updateAction: '/api/users/update',
    deleteAction: '/api/users/delete'
  },
  fields: {
    id: { key: true, list: false },
    name: { title: 'Name' },
    email: { title: 'Email', type: 'email' }
  }
});
```

As a module:
```JS
import '@liedekef/ftable/ftable.css';
import FTable from '@liedekef/ftable';

const table = new FTable('#table', {
  actions: {
    listAction: '/api/users',
    createAction: '/api/users/add',
    updateAction: '/api/users/update',
    deleteAction: '/api/users/delete'
  },
  fields: {
    id: { key: true, list: false },
    name: { title: 'Name' },
    email: { title: 'Email', type: 'email' }
  }
});
```

## Notes
See the wiki for documentation, demos, themes and more...
