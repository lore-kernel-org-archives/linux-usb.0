Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DDC202C46
	for <linux-usb@vger.kernel.org>; Sun,  7 Jun 2026 02:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780798647; cv=none; b=fMpYjxRBmI6Fn7WNJ0jmvVyEhjIaH+1AQ2GgJAp35alez4GdbxK/oPtX0wawfaO9RRDROg4e/EebGts/kxccy5DIS0rloNV/1qeoywuKQRB3WYdB5o/9puG8AQVquYSxuvh1sab2wtMJgu5056Xzw/DGsCTnuZNdaY5HHp+N1i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780798647; c=relaxed/simple;
	bh=0kIu9GExFHxQGzx0IoiCflPz3tgC2Cnrq2tghKRDkjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jDBNaR0Tg2Q/oljQCIu+RBqx6QXa0bSWFyGz0Rgtobwwpwus1Tkmw0HLusaIdvwoglf2OaoxkmefUz/0/7ixYEvnRhm6TyzBfIVTs9TYy3ESnU9xuzv+FUVZSeK+QTP9Lej/kFb93nxdmPrPvHbrjrvA3F+xnDldKUc012drpwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Dg2a0DUm; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Dg2a0DUm"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5176d4c14f5so26524621cf.0
        for <linux-usb@vger.kernel.org>; Sat, 06 Jun 2026 19:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1780798645; x=1781403445; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CvKIbvqF6NIedqj9oYLsT7txpQyfdzLkg4qwNPjy5Q0=;
        b=Dg2a0DUmSAqyV9hYJjCobnIppUJCA0Xi7XquAoTjjNMWaBvm21ZEQpLQIle8Sn/aWz
         PLHdIcy8+o5flP2qmSmFDZy9l+/r7JPgEcB860tX+CjvZQsa/mQqYYFG+Rq/EX2FewSO
         ewkhxhgIbi9Z/jIi+WN8Hjv38ieYnODQWCD7sC8nAihgN8Hr9J08z+EQ/OIed9h7L1dk
         SRBcGKSkPQoVabk+6k701hUDSIme/qLbdD8nEeG0mBFYJlfodJDW1lecIB0UAeOwBAEl
         65XYk0zJrxsB6f8nDTbRxgKRSa3+AYYyEUQB0zZ4N+k4BebSKcgB9aL+XCKZJWpAICP0
         gzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780798645; x=1781403445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CvKIbvqF6NIedqj9oYLsT7txpQyfdzLkg4qwNPjy5Q0=;
        b=IIPA74a/rabNDRuEapktKb7UKr3T92kBSn31kGacDrlRV4rrIYoDjGvPM9qXfL1LpR
         AfPKH6CP+iOW7pXO3saJQGjdLunsHssgy8lxoAR2v705m8sLR5vuJrI92JHCvgF6KdIk
         Vyr3yZNHpah9rO7DgGAjETWEgIdduI0B/SCWR3HCFALVQ9ThX3KhAiL6mwmTYOs9GRlm
         bUYtyUxcFJYRWKL80GFAIPj2yCw2Lio7wVmnCBAAhqas+kPngWJJSUHfrwjSVD8ZrxuF
         gJPDGJILBTNJcD4VKeKF7fb8r07pIvhgwFtW5liMfyV6guxlqdygzvkjLkl6szNwDFEm
         z+Cg==
X-Forwarded-Encrypted: i=1; AFNElJ8n6YvHsCmxsNlaynvO3wWbn1iQ4XhoGyNBDm5o3WKa48BuRVm/y33RtJYySVjxcGGYsCX8eb1Ci10=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeS2/oGZtHtrxTgtyH5Ll4oMjBD/OTPsVT2GX3DCm8hAa7DLRB
	+PRQE5ZrqRmqnwde+EZZw/57a6xfBRmMq28puLekBmxGgtp4AL7EjjRrxP4+KC/EyA==
X-Gm-Gg: Acq92OEmvbZcCPpjmsIZRIn9l0aMc9ro/FmL2VdcA602TrfHIttRyd9+p++Pi8NnM0e
	jz6JnpZiEzYesTQLgSY3GiAr9WLObea6YvRr44rnVCMHjYH716OFS6lL6Cw4QBGbszVc6u/0gdx
	U7TPeVpVmPEAe9tn9UKgi6lT812gmTXoLCx0DuWW28Qg7O2jAIamTSytu46TvJqlh2WygsqtTIL
	gNnrr825QNXAB999yfhwS/1xtn82zro8uB9gxO5eT/j/beIB+Y4yjoa6ZWTgO7WvFKE+/g4A81N
	3fw66oM93nu8MIJzWjz4KCscVDUezZakQVRXLwO551cj6cuK2OPRtvdrWKcQyxiJSGVPmAVFGby
	9z8f2XRQ5cy+ZEAwfqzzATF+eJm0Hk4nYq9qYMavUzDn6MdroIbZFntgjxy1wjl2a0O3sf7CXjU
	ZynCAuq8N3gpPoyR2K4iqaKejqVPFlHCnKUi+TbQkMJKBp+/8tkEHgANWWjR39DfIv
X-Received: by 2002:a05:622a:11c3:b0:517:5b22:f4ac with SMTP id d75a77b69052e-51795a48330mr141589961cf.5.1780798644619;
        Sat, 06 Jun 2026 19:17:24 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccdcc968sm130490136d6.22.2026.06.06.19.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 19:17:23 -0700 (PDT)
Date: Sat, 6 Jun 2026 22:17:20 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Nikhil Solanke <nikhilsolanke5@gmail.com>, linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org, mathias.nyman@linux.intel.com,
	sakari.ailus@linux.intel.com, katieeliu@tencent.com,
	johannes.bruederl@gmail.com, kees@kernel.org, dengjie03@kylinos.cn,
	limiao@kylinos.cn, wse@tuxedocomputers.com, dev@a1rm4x.com,
	vahnenko2003@gmail.com, cs@tuxedo.de, lijiayi@kylinos.cn,
	oneukum@suse.com, bence98@sch.bme.hu, eeodqql09@gmail.com
Subject: Re: USB: Request for guidance investigating configuration descriptor
 enumeration failure
Message-ID: <1996a7ac-2670-4124-b855-6fdf0c9999ad@rowland.harvard.edu>
References: <CAFgddh+JWdT4LLwMc5qjM8q_pBu-fRo2qADR5ovAKoGHWMQrRw@mail.gmail.com>
 <20260531101612.332151d8.michal.pecio@gmail.com>
 <CAFgddhLGHvTmRxWtguXTpgZV_Mq5ZW=CVK_ZkqbOgUF9Y5bCsA@mail.gmail.com>
 <20260531123843.736bd69a.michal.pecio@gmail.com>
 <3b79ba92-1c51-420b-a5d2-8a358cafdbf6@rowland.harvard.edu>
 <20260601084846.433bfc51.michal.pecio@gmail.com>
 <CAFgddh+dLnR=AuAU65sxqsxAgqLYX9i0OiX3Ys_sPH+YeZuHVw@mail.gmail.com>
 <20260602193047.5fe03b8d.michal.pecio@gmail.com>
 <49acc9dd-9d2e-4a37-9b41-de5e16445461@rowland.harvard.edu>
 <20260604125323.1bcb40d7.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604125323.1bcb40d7.michal.pecio@gmail.com>

On Thu, Jun 04, 2026 at 12:53:23PM +0200, Michal Pecio wrote:
> On Wed, 3 Jun 2026 22:02:44 -0400, Alan Stern wrote:
> > I used a bus analyzer to capture what happens when Windows 11 
> > initializes and enumerates a USB-2 flash drive.  The short answer is 
> > that yes, the initial Get-Configuration-Descriptor request is for 255 
> > bytes.
> 
> Could you also try a few BIOSes, UEFIs and such?
> Or anything from Apple?

Here's the information.  It may not clear things up as much as you would 
like.

Samsung UEFI BIOS:
	Get Device Desc		8
	Set Address
	Get Device Desc		18
	Get Config Desc		255
	Set Config

Lenovo UEFI BIOS:
	Set Address
	Get Device Desc		8
	Get Device Desc		8
	Get Device Desc		18
	Get Config Desc		8
	Get Config Desc		32
	Get String Desc 0	2
	Get String Desc 0	4
	Set Config

IpadOS 26.5:
	Set Address
	Get Device Desc		18
	Get String Desc 2	2
	Get String Desc 2	34
	Get String Desc 1	2
	Get String Desc 1	18
	Get String Desc 3	2
	Get String Desc 3	50
	Get Config Desc		9
	Get Config Desc		32
	Set Config

OSX 10.5:
	Get Device Desc		18
	Set Address
	Get Device Desc		18
	Get String Desc 2	2
	Get String Desc 2	34
	Get String Desc 1	2
	Get String Desc 1	18
	Get String Desc 3	2
	Get String Desc 3	50
	Get Config Desc		8
	Get Config Desc		32
	Set Config

The OSX recording was made from a very old MacBook Air, and it wouldn't 
be surprising if OSX has changed in the meantime.  The Ipad was fairly 
recent, however, as was the Lenovo.  The Samsung was perhaps 10 years 
old.

BTW, here's the lsusb output for the flash drive I used as a test 
device.  It explains why some of the systems asked for string 
descriptors 1, 2, and 3:

Bus 003 Device 005: ID 0930:6544 Toshiba Corp. TransMemory-Mini / Kingston DataTraveler 2.0 Stick
Couldn't open device, some information will be missing
Negotiated speed: High Speed (480Mbps)
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            0 [unknown]
  bDeviceSubClass         0 [unknown]
  bDeviceProtocol         0 
  bMaxPacketSize0        64
  idVendor           0x0930 Toshiba Corp.
  idProduct          0x6544 TransMemory-Mini / Kingston DataTraveler 2.0 Stick
  bcdDevice            1.00
  iManufacturer           1 Kingston
  iProduct                2 DataTraveler G3 
  iSerial                 3 0013729B6EB8C1107559071E
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0020
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              100mA
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
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval             255
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval             255

I suspect that non-storage devices (such as an Xbox clone) might have 
more stringent requirements, because they don't need to be visible to a 
BIOS.  In general, imitating Windows is almost certainly the best 
approach -- except perhaps for a few devices which are meant to be used 
exclusively with Macs.

Alan Stern
