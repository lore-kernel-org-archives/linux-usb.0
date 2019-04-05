Return-Path: <SRS0=hNA8=SH=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C86FC282CE
	for <linux-usb@archiver.kernel.org>; Fri,  5 Apr 2019 19:19:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2610121738
	for <linux-usb@archiver.kernel.org>; Fri,  5 Apr 2019 19:19:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731743AbfDETTp convert rfc822-to-8bit (ORCPT
        <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 5 Apr 2019 15:19:45 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.211]:47573 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731183AbfDETTo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Apr 2019 15:19:44 -0400
Received: from [67.219.247.53] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-4.bemta.az-d.us-east-1.aws.symcld.net id CD/4E-07938-E4AA7AC5; Fri, 05 Apr 2019 19:19:42 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMKsWRWlGSWpSXmKPExsXi5LtOQNdv1fI
  YgwnbtCwWLWtldmD0+LxJLoAxijUzLym/IoE1Y9XnT8wFX7krTuy8w9TAeIGzi5GLQ0hgFaPE
  nVXv2boYOYGcPYwSszZngdhsAoYS57a8ZQexRQSsJSY9+MQEYjML6EtcnrKEBcQWFpCRODz5K
  lSNjMTygw+YIGw9iV+zZ4PNZBFQkejYMom1i5GDgxdozpU5VSBhRgExie+n1kCNFJe49WQ+mC
  0hICCxZM95ZghbVOLl43+sELaCxNIPf9kh6nUkFuz+xAZhm0v0TV3CCGFrSyxb+Bqsl1dAUOL
  kzCcsIGuFgE6Ys0FrAqPILCTbZiGZNAvJpFlIJs1CMmkBI+sqRpOkosz0jJLcxMwcXUMDA11D
  QyNdS11DvcQq3RS90mLd1MTiEhC3vFivuDI3OSdFLy+1ZBMjMIJSCjgZdzBuWZ5+iFGSg0lJl
  Pf+4uUxQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4W1YC5QSLUtNTK9Iyc4CxDJOW4OBREuEtBk
  nzFhck5hZnpkOkTjHqchxY9HAusxBLXn5eqpQ4b/gKoCIBkKKM0jy4EbC0colRVkqYl5GBgUG
  IpyC1KDezBFX+FaM4B6OSMG8JyBSezLwSuE2vgI5gAjrConQ+yBEliQgpqQbGBe0FHtHnRe/d
  9WhV4N803T+wLFiz4OPF4EM8Ht/idlrNXZFxQmyjUa/jhuxpty6s2+uxNnD2m395enbd70KyO
  BZGbL+1Uj4zpSN/hoTcDuZb5/QubLH+cZ/9sdi7Gaa3Hh6dfFHlovS9NyZOqR9q5NwKHl9X4w
  r3Ylc8NI2v9MBi/nPTatcLKbEUZyQaajEXFScCACMxAuwmAwAA
X-Env-Sender: Seth.Bollinger@digi.com
X-Msg-Ref: server-7.tower-425.messagelabs.com!1554491982!7428962!1
X-Originating-IP: [66.77.174.16]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32443 invoked from network); 5 Apr 2019 19:19:42 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
  by server-7.tower-425.messagelabs.com with SMTP; 5 Apr 2019 19:19:42 -0000
Received: from MTK-SMS-XCH05.digi.com (10.10.8.199) by MCL-VMS-XCH01.digi.com
 (10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 5 Apr 2019
 14:19:42 -0500
Received: from MTK-SMS-XCH01.digi.com ([fe80::cca7:5299:c88e:1c40]) by
 MTK-SMS-XCH05.digi.com ([fe80::a576:56af:8463:b976%15]) with mapi id
 14.03.0415.000; Fri, 5 Apr 2019 14:19:42 -0500
From:   "Bollinger, Seth" <Seth.Bollinger@digi.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "Bollinger, Seth" <Seth.Bollinger@digi.com>
Subject: Bug: VHCI + USB 3.0
Thread-Topic: VHCI + USB 3.0
Thread-Index: AQHU6+SEgulXK6TzJ0OKPp0lJzg2fA==
Date:   Fri, 5 Apr 2019 19:19:41 +0000
Message-ID: <41405930-1E38-4B4C-896E-CD97942C521F@digi.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.27.1.167]
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9FABB11C42A89B4A84E87E58AEC327F4@digi.com>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello All,

We recently have run into a problem using a USB 3.0 thumb drive over USBIP where the driver will unlink URBs when trying to mount a FAT partition.  This happens because of the remote XHCI controller returning errno 75 during IN URB processing.  I've traced the failure to the following steps:

1. usb-storage sends a SCSI READ_10 request OUT URB to vhci
2. vhci forwards to remote workstation over USBIP and submits the URB
3. usb-storage sends a 32K IN URB using a SG table
4. usb_sg_init notices that vhci bus doesn't support SG (usb/core/message.c:399)
5. usb_sg_init breaks the SG table into an URB for each SG entry (usb/core/message.c:418)
6. vhci forwards to remote and submits the URBs
7. XHCI processes the first URB, but the buffer is too small to contain the bulk of the data and sets errno -75 when it would overflow the URB buffer (xhci-ring.c:2371)

It appears to me when the SG read is broken into multiple URBs, the latency in processing the remote URBs is causing XHCI to fail the IN.  A similar error sometimes occurs on OUTs as well.  I apologize, but I don't remember the errno off the top of my head for the OUT.

I patched usb_sg_init to alloc/free a contiguous URB so as not to fragment INS/OUTS and this is working well so far.

1. Does that seem like the correct fix?
2. Is this fix something the community would be interested in?

I'm open to working on a more "correct" patch if prompted to do so (as long as we're not talking weeks of work...).

Thanks,

Seth
