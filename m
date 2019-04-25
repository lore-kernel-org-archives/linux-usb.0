Return-Path: <SRS0=WMKl=S3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86AE3C43218
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 13:29:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4581C212F5
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 13:29:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727282AbfDYN30 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Apr 2019 09:29:26 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.2]:54849 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726120AbfDYN30 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Apr 2019 09:29:26 -0400
Received: from [67.219.251.53] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-c.us-west-2.aws.symcld.net id 38/9F-22818-536B1CC5; Thu, 25 Apr 2019 13:29:25 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJKsWRWlGSWpSXmKPExsXi5LtOQNdk28E
  Ygw/7DSwWLWtltpj69yajA5PHzll32T0+b5ILYIpizcxLyq9IYM1Yuoi1YBFHxepnVQ2MUzi6
  GLk4hARWM0rMvTOZHcLZyyix7PVhpi5GTg42AUOJc1vesoPYIgIaEgcOvAWLMwuESbQfaQeKc
  3AICxhLXPlkC1FiIbFv+TImCFtPYvePm8wgNouAqsTnNV1sIDavgLXE1eXrWEFsRgExie+n1k
  CNFJe49WQ+mC0hICCxZM95ZghbVOLl43+sELaCRPOChWBrmQU0Jdbv0odoNZeY/vUj1BhFiSn
  dD9khVglKnJz5hAWkXEhARWLOBq0JjCKzkCybhTBoFpJBs5AMmoVk0AJG1lWM5klFmekZJbmJ
  mTm6hgYGuoaGRrqGxua6JiZ6iVW6yXqlxbrlqcUlukZ6ieXFesWVuck5KXp5qSWbGIFRlVLQq
  bODcd6K9EOMkhxMSqK81dMPxgjxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4L2/GSgnWJSanlqRlp
  kDjG+YtAQHj5II7+4tQGne4oLE3OLMdIjUKUZLjgOLHs5l5nh78DmQXHDz1zxmIZa8/LxUKXH
  eLJAGAZCGjNI8uHGwFHSJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjCvHsgUnsy8Eritr4AO
  YgI6qN7iAMhBJYkIKakGxqV5ZqbHZaM0V1zUUxPdd9L08uminXKJjGEFXwwkD6148WtXr+ld/
  mvlO+pbLc3WHt4x/U1686HXe27+i8tXu7VLiitlx6riX1uqUy++XqB7QF258c/Ch1xa0rGtD+
  rmLby1Kp65O14k3n/y0rSMpa6rxHuXqimLrZU/8vHW2ennr0udVHqSFqrEUpyRaKjFXFScCAC
  Swt7EPAMAAA==
X-Env-Sender: Seth.Bollinger@digi.com
X-Msg-Ref: server-22.tower-365.messagelabs.com!1556198964!8496382!1
X-Originating-IP: [66.77.174.16]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27930 invoked from network); 25 Apr 2019 13:29:24 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
  by server-22.tower-365.messagelabs.com with SMTP; 25 Apr 2019 13:29:24 -0000
Received: from MTK-SMS-XCH05.digi.com (10.10.8.199) by MCL-VMS-XCH01.digi.com
 (10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 25 Apr 2019
 08:29:23 -0500
Received: from MTK-SMS-XCH01.digi.com ([fe80::cca7:5299:c88e:1c40]) by
 MTK-SMS-XCH05.digi.com ([fe80::a576:56af:8463:b976%15]) with mapi id
 14.03.0415.000; Thu, 25 Apr 2019 08:29:23 -0500
From:   "Bollinger, Seth" <Seth.Bollinger@digi.com>
To:     USB list <linux-usb@vger.kernel.org>
CC:     "Bollinger, Seth" <Seth.Bollinger@digi.com>,
        Seth Bollinger <seth.boll@gmail.com>
Subject: Command ring abort xhci_handshake question
Thread-Topic: Command ring abort xhci_handshake question
Thread-Index: AQHU+2rlbQfenhxD80GPfwr9G42KVw==
Date:   Thu, 25 Apr 2019 13:29:23 +0000
Message-ID: <097F0764-F4F5-48FC-9BAA-276E88B1E676@digi.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.27.1.153]
Content-Type: text/plain; charset="utf-8"
Content-ID: <A1EFB0CC8297A748A94621D4992B72AF@digi.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGVsbG8gQWxsLA0KDQpSZWNlbnRseSBJ4oCZdmUgYmVlbiB0cm91Ymxlc2hvb3RpbmcgYSBwcm9i
bGVtIHdpdGggdGhlIGhvc3QgY29udHJvbGxlciBkeWluZyBhbmQgbm90aWNlZCB0aGF0IHdoZW4g
dGhlIGNvbnRyb2xsZXIgZGllcywgdGhlIHN5c3RlbSB3YXMgdW5yZXNwb25zaXZlIGZvciBhIF9s
b25nXyBwZXJpb2Qgb2YgdGltZS4gIFdoZW4gSSBleHBsb3JlZCB0aGUgY29kZSBhIGJpdCwgSSBz
YXcgdGhhdCB4aGNpX2hhbmRzaGFrZSB3aWxsIHNwaW4gd2l0aCBpbnRlcnJ1cHRzIGRpc2FibGVk
IGZvciB1cCB0byA1IHNlY29uZHMuICBJIGFsc28gc2F3IHBsYWNlcyB3aGVyZSBpdCB3b3VsZCBz
cGluIGZvciB1cCB0byAxMCBzZWNvbmRzIChJIGhhdmUgbm90IGV4cGVyaWVuY2VkIHRoaXMgdGhv
dWdo4oCmKS4gIDUgc2Vjb25kcyB3aXRoIGludGVycnVwdHMgZGlzYWJsZWQgc2VlbXMgbGlrZSBh
biBldGVybml0eS4NCg0KSXMgdGhlcmUgYSByZWFzb24gdGhhdCBpdOKAmXMgZG9uZSB0aGlzIHdh
eT8gIEl0IGxvb2tzIGxpa2UgdGhlIGNvZGUgd2FzIGluaGVyaXRlZCBmcm9tIGVoY2ksIHNvIHRo
ZSBjb2RlIGhhcyBiZWVuIHVzZWQgZm9yIGEgbG9uZyBwZXJpb2Qgb2YgdGltZS4NCg0KV291bGQg
aXQgYmUgcG9zc2libGUgdG8gd2FpdCBmb3IgdGhlIGNvbW1hbmQgcmluZyBzdG9wcGVkIGV2ZW50
IGZvciA1IHNlY29uZHMsIHRoZW4gY2hlY2sgdGhlIENSUiBiaXQgYW5kIGhhbHQgYW5kIGRpZSBp
ZiBpdOKAmXMgbm90IGNsZWFyZWQ/DQoNClRoYW5rcyENCg0KU2V0aA==
