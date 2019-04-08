Return-Path: <SRS0=iu7A=SK=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 788C3C10F13
	for <linux-usb@archiver.kernel.org>; Mon,  8 Apr 2019 12:39:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 48D9821473
	for <linux-usb@archiver.kernel.org>; Mon,  8 Apr 2019 12:39:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726570AbfDHMjI convert rfc822-to-8bit (ORCPT
        <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 8 Apr 2019 08:39:08 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.213]:53197 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726510AbfDHMjI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 Apr 2019 08:39:08 -0400
Received: from [67.219.250.197] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-b.us-west-2.aws.symcld.net id AE/CF-26556-9E04BAC5; Mon, 08 Apr 2019 12:39:05 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGKsWRWlGSWpSXmKPExsXi5LtOQPelw+o
  Ygx/zFCwWLWtltpjw+wKbA5PH7Ls/GD0+b5ILYIpizcxLyq9IYM34vPwHa8F/g4r9x1rZGhi/
  SXcxcnEICaxilFg0fxsThLOHUeJT+zHmLkZODjYBQ4lzW96yg9giAloSm5tegsWZBawlpq+5z
  djFyMEhLKAg8XSVDkSJosSPZyCtHEB2mMS/f8ogYRYBFYm1Xycxgti8QJ2bJu4GmyIk4Ctx4M
  szsOmcAn4S8+/tZQGxGQXEJL6fWsMEsUlc4taT+WC2hICAxJI955khbFGJl4//sULY8hJzbp1
  mh6jXkViw+xMbyAnMAuYSp75nQYS1JZYtfM0McYKgxMmZT1hASoSATpuzQWsCo9gsJMtmIRk0
  C2HQLCSDZiEZtICRdRWjeVJRZnpGSW5iZo6uoYGBrqGhka6hsbGumbFeYpVukl5psW55anGJr
  pFeYnmxXnFlbnJOil5easkmRmAcphS02u9gfLM8/RCjJAeTkijvgiurYoT4kvJTKjMSizPii0
  pzUosPMcpwcChJ8Arar44REixKTU+tSMvMASYEmLQEB4+SCK87MCkI8RYXJOYWZ6ZDpE4x6nI
  cWPRwLrMQS15+XqqUOK8ZyAwBkKKM0jy4EbDkdIlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OS
  MK8dyBSezLwSuE2vgI5gAjpiig7YESWJCCmpBkbjfY845h/aZmp5PSvC/pHFLfGZfC+j1vcW9
  T6WCdc/nF9z/VxunSzLKatiFj8G6+N/zZd2tffe7FihfOj5Mbsfb66Y7eaftveT0MQ7N549uq
  a0wvx/QWb3sqrJXrN3rrBT7T2y9L7LNqabN5h+3+ljZ9s9PyXiXGRNgEpZ2emn5ZuWdU4X2hG
  kxFKckWioxVxUnAgAlJD0iUkDAAA=
X-Env-Sender: Seth.Bollinger@digi.com
X-Msg-Ref: server-18.tower-345.messagelabs.com!1554727142!7030378!6
X-Originating-IP: [66.77.174.16]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9126 invoked from network); 8 Apr 2019 12:39:05 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
  by server-18.tower-345.messagelabs.com with SMTP; 8 Apr 2019 12:39:05 -0000
Received: from MTK-SMS-XCH03.digi.com (10.10.8.197) by MCL-VMS-XCH01.digi.com
 (10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 8 Apr 2019
 07:39:04 -0500
Received: from MTK-SMS-XCH01.digi.com ([fe80::cca7:5299:c88e:1c40]) by
 MTK-SMS-XCH03.digi.com ([fe80::484d:c326:e7f1:a9fd%16]) with mapi id
 14.03.0439.000; Mon, 8 Apr 2019 07:39:04 -0500
From:   "Bollinger, Seth" <Seth.Bollinger@digi.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Bug: VHCI + USB 3.0
Thread-Topic: Bug: VHCI + USB 3.0
Thread-Index: AQHU6+SEgulXK6TzJ0OKPp0lJzg2fKYuYXeAgAAIH4CAAS7ugIAABkMAgAADKICAAuoyAA==
Date:   Mon, 8 Apr 2019 12:39:04 +0000
Message-ID: <A91C245C-B630-47E8-9243-EB4CA8E91E51@digi.com>
References: <Pine.LNX.4.44L0.1904061204070.19196-100000@netrider.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1904061204070.19196-100000@netrider.rowland.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.10.81.30]
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C22FD4ED3BE2EA468E2DC99626EE47D1@digi.com>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Apr 6, 2019, at 11:08 AM, Alan Stern <stern@rowland.harvard.edu<mailto:stern@rowland.harvard.edu>> wrote:

Can you provide the "lsusb -v" output for the storage device as shown
on both computers?  I want to see if the server and the client disagree
on the maxpacket sizes for the bulk endpoints.  The key is that 3584 is
a multiple of 512 but not of 1024.

Sorry for the delay.

Physical device:

Bus 006 Device 006: ID 13fe:5500
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.10
  bDeviceClass            0
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0         9
  idVendor           0x13fe
  idProduct          0x5500
  bcdDevice            1.00
  iManufacturer           1
  iProduct                2 USB DISK 3.0
  iSerial                 3 070192D930D6C811
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength           44
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              504mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass         8
      bInterfaceSubClass      6
      bInterfaceProtocol     80
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               3
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               3
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength           22
  bNumDeviceCaps          2
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x00000006
      BESL Link Power Management (LPM) Supported
  SuperSpeed USB Device Capability:
    bLength                10
    bDescriptorType        16
    bDevCapabilityType      3
    bmAttributes         0x00
    wSpeedsSupported   0x000e
      Device can operate at Full Speed (12Mbps)
      Device can operate at High Speed (480Mbps)
      Device can operate at SuperSpeed (5Gbps)
    bFunctionalitySupport   2
      Lowest fully-functional device speed is High Speed (480Mbps)
    bU1DevExitLat          10 micro seconds
    bU2DevExitLat        2047 micro seconds
can't get debug descriptor: Resource temporarily unavailable
Device Status:     0x000c
  (Bus Powered)
  U1 Enabled
  U2 Enabled



Virtual Device:

Bus 004 Device 019: ID 13fe:5500 Kingston Technology Company Inc.
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.10
  bDeviceClass            0 (Defined at Interface level)
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0         9
  idVendor           0x13fe Kingston Technology Company Inc.
  idProduct          0x5500
  bcdDevice            1.00
  iManufacturer           1
  iProduct                2 USB DISK 3.0
  iSerial                 3 070192D930D6C811
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength           44
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              126mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      6 SCSI
      bInterfaceProtocol     80 Bulk-Only
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               3
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               3
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength           22
  bNumDeviceCaps          2
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x00000006
      Link Power Management (LPM) Supported
  SuperSpeed USB Device Capability:
    bLength                10
    bDescriptorType        16
    bDevCapabilityType      3
    bmAttributes         0x00
    wSpeedsSupported   0x000e
      Device can operate at Full Speed (12Mbps)
      Device can operate at High Speed (480Mbps)
      Device can operate at SuperSpeed (5Gbps)
    bFunctionalitySupport   2
      Lowest fully-functional device speed is High Speed (480Mbps)
    bU1DevExitLat          10 micro seconds
    bU2DevExitLat        2047 micro seconds
Device Status:     0x000c
  (Bus Powered)
  U1 Enabled
  U2 Enabled

Seth
