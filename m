Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v1,2/3] USB: DT probing support to ehci-npcm7xx
From: Avi Fishman <avifishman70@gmail.com>
Message-Id: <1527582935-31175-3-git-send-email-avifishman70@gmail.com>
Date: Tue, 29 May 2018 11:35:34 +0300
To: gregkh@linuxfoundation.org, stern@rowland.harvard.edu
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, venture@google.com, yuenn@google.com, brendanhiggins@google.com, mathias.nyman@linux.intel.com, bjorn.andersson@linaro.org, jhogan@kernel.org, albeu@free.fr, chunfeng.yun@mediatek.com, tony@atomide.com, baolu.lu@linux.intel.com, elder@linaro.org, digetx@gmail.com, kstewart@linuxfoundation.org, hdegoede@redhat.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, openbmc@lists.ozlabs.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, davem@davemloft.net, mchehab+samsung@kernel.org, akpm@linux-foundation.org, rdunlap@infradead.org, Avi Fishman <AviFishman70@gmail.com>
List-ID: <linux-usb.vger.kernel.org>

RnJvbTogQXZpIEZpc2htYW4gPEF2aUZpc2htYW43MEBnbWFpbC5jb20+CgpEZXZpY2UgVHJlZSBk
b2N1bWVudGF0aW9uIGZvciBOdXZvdG9uIG5wY203eHggRUhDSSBkcml2ZXIuCgpTaWduZWQtb2Zm
LWJ5OiBBdmkgRmlzaG1hbiA8QXZpRmlzaG1hbjcwQGdtYWlsLmNvbT4KLS0tCiBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL25wY203eHgtdXNiLnR4dCB8IDE4ICsrKysrKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL25wY203eHgtdXNi
LnR4dAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2Iv
bnBjbTd4eC11c2IudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9u
cGNtN3h4LXVzYi50eHQKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi42
Mjg2OTJkZmY3ZTQKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvdXNiL25wY203eHgtdXNiLnR4dApAQCAtMCwwICsxLDE4IEBACitOdXZvdG9uIE5Q
Q003WFggU29DIFVTQiBjb250cm9sbGVyczoKKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CisKK0VIQ0k6CistLS0tLQorCitSZXF1aXJlZCBwcm9wZXJ0aWVzOgorLSBjb21wYXRpYmxlOiAi
bnV2b3RvbixucGNtNzUwLWVoY2kiCisgIHRoYXQgc2VydmljZXMgaW50ZXJydXB0cyBmb3IgdGhp
cyBkZXZpY2UKKy0gaW50ZXJydXB0czogU2hvdWxkIGNvbnRhaW4gdGhlIEVIQ0kgaW50ZXJydXB0
CisKK0V4YW1wbGU6CisKKwllaGNpQGUxODAwMDAwIHsKKwkJY29tcGF0aWJsZSA9ICJudXZvdG9u
LG5wY203NTAtZWhjaSIsICJ1c2ItZWhjaSI7CisJCXJlZyA9IDwweGYwODA2MDAwIDB4MTAwMD47
CisJCWludGVycnVwdHMgPSA8MCA2MSA0PjsKKwl9Owo=
