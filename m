Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: usb: usbfs: fix crash in check_ctrlrecip()->usb_find_alt_setting()
From: Vladis Dronov <vdronov@redhat.com>
Message-Id: <13984886.16016319.1537887354102.JavaMail.zimbra@redhat.com>
Date: Tue, 25 Sep 2018 10:55:54 -0400 (EDT)
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Oliver Neukum <oneukum@suse.com>, Hans de Goede <hdegoede@redhat.com>, syzkaller@googlegroups.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, stable <stable@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

PiBXaGF0IHJlYXNvbiBpcyB0aGVyZSBmb3IgaGF2aW5nIHR3byBkaWZmZXJlbnQgZml4ZXMgZm9y
IHRoZSBzYW1lIGJ1Zz8KPiBUaGlzIG9uZSBpc24ndCBnb2luZyB0byBnZXQgaW50byBhbnkgbWFp
bmxpbmUgdHJlZXMgdGhhdCBkb24ndCBhbHJlYWR5Cj4gaGF2ZSBjOWE0Y2IyMDRlOWUuCgpJIGJl
bGlldmUgdGhpcyBpcyB0aGUgcmlnaHQgdGhpbmcgdG8gZG8sIHNvIHVzYl9maW5kX2FsdF9zZXR0
aW5nKCkKaXMgbm90IGNhbGxlZCB3aXRoIGEga25vd24tYmFkIGFyZ3VtZW50LgoKSG9uZXN0bHks
IEkgd291bGQgY2hhbmdlICJpZiAoIWNvbmZpZykiIGluIHVzYl9maW5kX2FsdF9zZXR0aW5nKCkg
dG8KIkJVR19PTighY29uZmlnKSIgc28gd2Uga25vdyB3aGVuIGl0cyBjYWxsZXJzIGRvIHNtdGgg
d3JvbmcgYW5kIGdvCmZpeCBjYWxsZXJzLiBVbmZvcnR1bmF0ZWx5LCBJIHVuZGVyc3RhbmQgdGhp
cyBoYXJkbHkgd2lsbCBiZSBhY2NlcHRlZC4KCkJlc3QgcmVnYXJkcywKVmxhZGlzIERyb25vdiB8
IFJlZCBIYXQsIEluYy4gfCBQcm9kdWN0IFNlY3VyaXR5IEVuZ2luZWVyCg==
