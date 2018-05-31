Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,2/3] USB: DT probing support to ehci-npcm7xx
From: Avi Fishman <avifishman70@gmail.com>
Message-Id: <1527788430-12494-3-git-send-email-avifishman70@gmail.com>
Date: Thu, 31 May 2018 20:40:29 +0300
To: gregkh@linuxfoundation.org, stern@rowland.harvard.edu
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, venture@google.com, yuenn@google.com, brendanhiggins@google.com, mathias.nyman@linux.intel.com, bjorn.andersson@linaro.org, jhogan@kernel.org, albeu@free.fr, chunfeng.yun@mediatek.com, tony@atomide.com, baolu.lu@linux.intel.com, elder@linaro.org, digetx@gmail.com, kstewart@linuxfoundation.org, hdegoede@redhat.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, openbmc@lists.ozlabs.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, Avi Fishman <AviFishman70@gmail.com>
List-ID: <linux-usb.vger.kernel.org>

RnJvbTogQXZpIEZpc2htYW4gPEF2aUZpc2htYW43MEBnbWFpbC5jb20+CgpEZXZpY2UgVHJlZSBk
b2N1bWVudGF0aW9uIGZvciBOdXZvdG9uIG5wY203eHggRUhDSS4KClNpZ25lZC1vZmYtYnk6IEF2
aSBGaXNobWFuIDxBdmlGaXNobWFuNzBAZ21haWwuY29tPgotLS0KIERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy91c2IvbnBjbTd4eC11c2IudHh0IHwgMTcgKysrKysrKysrKysrKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9ucGNtN3h4LXVzYi50eHQKCmRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL25wY203eHgt
dXNiLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvbnBjbTd4eC11
c2IudHh0Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uYjY4MmJlYzEw
M2Y5Ci0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3VzYi9ucGNtN3h4LXVzYi50eHQKQEAgLTAsMCArMSwxNyBAQAorTnV2b3RvbiBOUENNN1hYIFNv
QyBVU0IgY29udHJvbGxlcnM6CistLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorCitFSENJ
OgorLS0tLS0KKworUmVxdWlyZWQgcHJvcGVydGllczoKKy0gY29tcGF0aWJsZTogIm51dm90b24s
bnBjbTc1MC1laGNpIgorLSBpbnRlcnJ1cHRzOiBTaG91bGQgY29udGFpbiB0aGUgRUhDSSBpbnRl
cnJ1cHQKKworRXhhbXBsZToKKworCWVoY2kxOiB1c2JAZjA4MDYwMDAgeworCQljb21wYXRpYmxl
ID0gIm51dm90b24sbnBjbTc1MC1laGNpIjsKKwkJcmVnID0gPDB4ZjA4MDYwMDAgMHgxMDAwPjsK
KwkJaW50ZXJydXB0cyA9IDwwIDYxIDQ+OworCX07Cg==
