Return-Path: <SRS0=hNA8=SH=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE0EC282CE
	for <linux-usb@archiver.kernel.org>; Fri,  5 Apr 2019 21:30:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1CB6F21726
	for <linux-usb@archiver.kernel.org>; Fri,  5 Apr 2019 21:30:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726206AbfDEVa2 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 5 Apr 2019 17:30:28 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.210]:37299 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725973AbfDEVa2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Apr 2019 17:30:28 -0400
Received: from [67.219.251.53] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-c.us-west-2.aws.symcld.net id 03/B8-24550-1F8C7AC5; Fri, 05 Apr 2019 21:30:25 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFKsWRWlGSWpSXmKPExsXi5LtOQPfjieU
  xBivnSlssWtbKbDHh9wU2ByaP2Xd/MHp83iQXwBTFmpmXlF+RwJoxffNuloLtLBU7Vn1gbGA8
  w9zFyMUhJLCKUeLhqwlMEM4eRondk5aydjFycrAJGEqc2/KWHcQWEdCS2Nz0khnEZhawlpi+5
  jZjFyMHh7CAgsTTVToQJYoSP54dY4awrST2Lu0HG8MioCIxa+czJhCbF6h17qtNYDVCAj4Se5
  ZcB4tzCvhKrNv/FGwVo4CYxPdTa5ggVolL3HoyH8yWEBCQWLLnPDOELSrx8vE/VghbQeL6+dv
  sEPU6Egt2f2KDsM0l5u98wgJha0ssW/iaGeIGQYmTM0HiHEA3qEjM2aA1gVFsFpJts5BMmoVk
  0iwkk2YhmbSAkXUVo0VSUWZ6RkluYmaOrqGBga6hoZGuobGFrqGFgV5ilW6yXmmxbnlqcYmuk
  V5iebFecWVuck6KXl5qySZGYDymFHRt2cE4Y0X6IUZJDiYlUV6lDctjhPiS8lMqMxKLM+KLSn
  NSiw8xynBwKEnweh8HygkWpaanVqRl5gATA0xagoNHSYQ3ASTNW1yQmFucmQ6ROsWoy3Fg0cO
  5zEIsefl5qVLivPkgRQIgRRmleXAjYEnqEqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3hyQ
  KTyZeSVwm14BHcEEdIRF6XyQI0oSEVJSDYzZVZJFW94ey1h5b82Jds24FZuP28/8vWGiwoyJ0
  xhmNlzv6L7u9aftupzrNL2D+gffKj1vZA+5FaJ4NTdC9Otz62ItzgvrQlV2sZ6KfWTx/sz29u
  nCOSkmjjI71qvGXjq7xTakZ29Z2Ka869HyYaG7kp9v6ZHkEj3UnvYuzObA+Zsv3318sFJRiaU
  4I9FQi7moOBEAiowWHE0DAAA=
X-Env-Sender: Seth.Bollinger@digi.com
X-Msg-Ref: server-11.tower-365.messagelabs.com!1554499824!6788723!1
X-Originating-IP: [66.77.174.16]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4187 invoked from network); 5 Apr 2019 21:30:25 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
  by server-11.tower-365.messagelabs.com with SMTP; 5 Apr 2019 21:30:25 -0000
Received: from MTK-SMS-XCH05.digi.com (10.10.8.199) by MCL-VMS-XCH01.digi.com
 (10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 5 Apr 2019
 16:30:24 -0500
Received: from MTK-SMS-XCH01.digi.com ([fe80::cca7:5299:c88e:1c40]) by
 MTK-SMS-XCH05.digi.com ([fe80::a576:56af:8463:b976%15]) with mapi id
 14.03.0415.000; Fri, 5 Apr 2019 16:30:24 -0500
From:   "Bollinger, Seth" <Seth.Bollinger@digi.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Bug: VHCI + USB 3.0
Thread-Topic: Bug: VHCI + USB 3.0
Thread-Index: AQHU6+SEgulXK6TzJ0OKPp0lJzg2fKYuYXeAgAAIH4A=
Date:   Fri, 5 Apr 2019 21:30:23 +0000
Message-ID: <FCCAD5C7-4836-45F1-85EE-51E5AE001740@digi.com>
References: <Pine.LNX.4.44L0.1904051658360.1442-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1904051658360.1442-100000@iolanthe.rowland.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.27.1.158]
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4CBDF7D5F5064343ACCCE2171B39CEBD@digi.com>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Apr 5, 2019, at 4:01 PM, Alan Stern <stern@rowland.harvard.edu<mailto:stern@rowland.harvard.edu>> wrote:

Why is the remote buffer too small?  If you can figure that out then
you should be able to fix the problem pretty easily.

The usb-storage driver is doing a 32K read.  When it does the read all in one buffer, it succeeds.  If it does it using a scatter gather read (which generates an URB for each fragment in usb_sg_init), then it fails because the first URB only wants to read something like 3K.

(Sorry, forgot to reply to the list as well)

Seth
