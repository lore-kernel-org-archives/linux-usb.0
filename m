Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787449;
	b=0cg2Wm3npeCofrTieH8roLPeWqsSSdo9fbYnmWLnz3JlDzc9joel9zHSdjwGHArx8B5h
	 acMAX3Xv//tkLUyXEGVlfMBB0ToVHWEFsJvaGFqreYhrCOrL7JeNDbORoCiRpovnYIozp
	 l3aaYWfoQWQ9IRiXlscgwHIGyv9RwMlBN5QY5vTHjx50TcNBVxNXh/8/ImXyVQhYYWYD9
	 UKwi/IP7NAuJzyT2KIZQ+aK4ojbL6btE5r2VNHTipsCkr3bjWIiL6/V0ZCh5YnTxTN26K
	 wRXi/crwoNh0QjEubzcJupp9aItkLMf6VoxWIkR2G+KdQrpmlTvYbo5m7UQ+eoPoZFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787449;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=LmshqU8iFl+DTWdxh34hFxjfheHemYJBiUI1k4NPyEU=;
	b=mv4XVvmtRqhGxn99Aru3HwNKuoPOqTZ2xCP4zmfct5cci6oIdSpTuLZhYwlVweTVUkjU
	 9/6JtiP7FhmUxDin0tr4uiYG2bYxMLjW8NoifRVyk1M68Wbc0MBIzJPkT2OKVq9/QJofj
	 f1YceHpnMgHG1OwGo5svmG7gLBkVAG8zVlt9pdE8gt7ZbgB7gVXP0bEDfjEYpq4wb9zPJ
	 bcjCz7g9p6BL2irKBdvzAhsFVINgf/McEkcdI8Xk1TB2ndK7KUmn4dsd0yfKbiCH2wAx8
	 Dem9PsentXIj4Fe49m1KrJlFudv86X0yVL1ZBCslOUZq0rPxeYIFpVxW3bpJ9ajLJTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X67h188M;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A736606A31B
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 10:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A736606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X67h188M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793787449; x=1825323449;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TPFXIsrzAgDAI+IJh4Oz4vTThkUaacb3nO4K5NORpZE=;
  b=X67h188Mrvk4lYCdbuY3a3rX5lH8dU3X8tp9P72FD2/hZqaCf14cfNr9
   rUTXnjfRPWJJoxrirC+czEbBp0d599CmTXzRDT2zrFf10ePKKTiKTvq+c
   Fy3gHzmV04/A9L3DKMs+WeA/lv1F2oCBvW5TRDVkeKc+IoPUP7eAnWFON
   rg3GfsIxFzpGpGOt3G3JX0GU+xSX9RP1gBAuu01Iq5XZ5+MScAu1S7HqD
   GHJm2Pp1W0BLOaQ7lSls8tD6+bbtmZ554VFXvMcRNy5VfITjdXsXaTumN
   cDdnnoB9qLSQNfC2xkJEipOukiJ+o9TGFv6iseEBLs4BOWIXqprp+rW5e
   g==;
X-CSE-ConnectionGUID: W56qo4TZQLyxE1k54wsVmw==
X-CSE-MsgGUID: uCP1iXxFRl6Yl9U+7WHDOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2533549"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2533549"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 02:17:28 -0800
X-CSE-ConnectionGUID: 9wcaKgrPT5K686+CVdcF2w==
X-CSE-MsgGUID: 3NUaASUATBaQSascTREALw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6837142"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 04 Nov 2026 02:17:27 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 1381299; Wed, 04 Nov 2026 11:17:26 +0100 (CET)
Date: Wed, 4 Nov 2026 11:17:26 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Peter Walker <peter.walker78@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: ucsi_acpi: "bogus connector number in CCI: 2" flood on Acer
 Aspire A14-61M
Message-ID: <ausGNtWlRzZN29ux@black.igk.intel.com>
References: <CAPv=dGA4maJEzJ1mt6udD71WFD8SbxGFfun5Hg8PpvGEb038HA@mail.gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPv=dGA4maJEzJ1mt6udD71WFD8SbxGFfun5Hg8PpvGEb038HA@mail.gmail.com>

Hi Peter,

On Tue, Oct 20, 2026 at 10:53:06PM +0100, Peter Walker wrote:
> Hello,
> 
> On an Acer Aspire A14-61M the kernel log fills with
> 
> ucsi_acpi USBC000:00: bogus connector number in CCI: 2

How many USB Type-C ports does this system have?

> at 2-4 lines a second for as long as the machine is awake, about
> 290,000 lines a day.
> 
> 
> System
> 
> Acer Aspire A14-61M (board Tiguan_SKF), AMD Ryzen AI 5 340
> BIOS INSYDE V1.29 (03/24/2026); also seen on V1.00 (04/09/2025)
> Kernel 7.2.7-ogc1.1.fc44 (Bazzite); also seen on 7.2.3 and 7.2.4
> ACPI device USBC000:00 (\_SB_.UBTC), defined in DSDT and SSDT31
> 
> 
> Where it happens
> 
> The message comes from the connector bounds check in
> ucsi_notify_common(). The laptop has two USB-C ports, but the PPM
> reports one connector, so only port0 is registered, and it then sends
> connector change notifications for connector 2.
> 
> GET_CAPABILITY (through the ucsi debugfs command file):
> 
> 0x01300300012000020000b40100000144
> bmAttributes 0x00000144, bNumConnectors 1, bmOptionalFeatures 0xb4,
> bNumAltModes 2, BC 1.2, PD 3.0, Type-C 1.3
> 
> GET_CONNECTOR_STATUS for connector 2 is answered without error. While
> the messages are being printed it returns:
> 
> 0x00000000000000010000000020004260
> change 0x4260 (PDOS, POWER_LEVEL, BC, CONNECT), not connected
> 
> As soon as that command has been issued the messages stop, and reading
> it again shows the change field cleared:
> 
> 0x00000000000000010000000020000000
> 
> 
> How to reproduce
> 
> 1. With no messages being printed, unplug the charger.
> 
> 2. About 5 seconds later the messages start. They carry on whether the
> charger is plugged back in, moved to the other port or left out.
> 
> 3. s2idle suspend pauses them; they start again 1-3 seconds after
> resume.
> 
> 4. Writing 0x20012 (GET_CONNECTOR_STATUS, connector 2) to
> /sys/kernel/debug/usb/ucsi/USBC000:00/command stops them: 17 messages
> in the 5 seconds before, none in the 5 seconds after. A suspend/resume
> cycle afterwards did not bring them back; the next charger unplug did.
> 
> 
> Other observations
> 
> - While the messages are being printed, port0 does not follow the
> charger. GET_CONNECTOR_STATUS for connector 1 reported it connected
> with a PD contract (opmode PD, sink, partner DFP, RDO 0x53851545,
> change 0x4a60), while sysfs showed port0 with no partner,
> power_operation_mode "default", and ucsi-source-psy-USBC000:001
> online=0. Three seconds after the GET_CONNECTOR_STATUS(2) in step 4,
> "UCSI_GET_PDOS failed (-70)" was logged and port0-partner, port0-cable
> and port0-plug0 appeared, with power_operation_mode
> "usb_power_delivery" and the power supply online=1.
> 
> - "UCSI_GET_PDOS failed (-70)" is also logged twice at probe on every
> boot.
> 
> - Charger plug and unplug also arrive through acer_wmi as "Unknown
> function number - 9 - 1" and "- 9 - 0".
> 
> I have the DSDT/SSDT tables, the full sysfs state and the journal, and
> I'm happy to run further tests.

Okay, can you try this:

diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index a71d070466a7b..1425b531b6f54 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -253,7 +253,6 @@ static const struct dmi_system_id ucsi_acpi_quirks[] = {
        {
                .matches = {
                        DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
-                       DMI_MATCH(DMI_PRODUCT_NAME, "Nitro ANV15-41"),
                },
                .driver_data = (void *)&ucsi_acer_ops,
        },


Thanks,

-- 
heikki
