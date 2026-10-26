Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793020120;
	b=4VheLy1vOAJ1Xtv0X4YDSHOTHmV0fphxhqMns706MNCy5RZLJgzvlN/KqC3n+nCXdO5u
	 oi33aSup3leHnTF0kij//WR6PJ37ehxF6Sfq+F2EqissOi/stnIBnbjxOfBT6IGwdeEfU
	 jG30eY9seXLj5HxW7iJXa/9r8r2ox2zLDjY9UwFnXZWhb6REzWq1b9sRAzpdvgTBHHxEn
	 x8RMA7s/rnHI3bZsoiqS6PgFov/T+DZ+3Z5fhrVnD5gG3oK4hEnyb9QcToFcewgO5JVco
	 1wSGOoEXOJJjBXE86kY0pA5N2J11jhL77F9CzFsjqw93oAosE7+tG6C96bKFY6faHeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020120;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=mkWBryoc5hcLUraRmqqOLMfY19fMWOD4lRFGgU7JDyw=;
	b=GcRcLKEGKWu2CQ4utecUQRPLAH1wgvhT0xZhl4g5495e5/WTfTRnMMQvpvL9Wqj5EOC0
	 6/KIGEaMfWHk9tzrlWEekjCbZrFjweM4ZFyKr+RDeHJAAbtmOkDJ4qUh4DUzJVcokK11b
	 /jvBdk2pd5/BCyP06vWi0Ic33MQqhzlqc+FEnWPLPwD9aR7JPJ5KpgTdsCfNdMkmepc1F
	 nlFjMAydaQyk7NgLyZo2d1p8WA1k9OrC7zNas0/2ck8UdGi7zOTqXJSxufJlHqRW5g5V6
	 cAgT5YkWbyIqQxUvz1EAmWAWO2gGJZgadDV+Wnh/boY8HzP04rjhSJKIWSq2asy1ZMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mys7brhX;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092DD606A31A
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 13:08:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 092DD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mys7brhX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793020121; x=1824556121;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=8NpdGVLv/OQdWGoloRyNrlXe16EzE44S7iZPqhSLHtw=;
  b=mys7brhXGXyERvyY4emioIOTStv5VPJJJx1ac1Pe8q64E0av96Wnwww/
   f4lJj6TkAesu6jdATKIdeLEr10QkQJqXa/oo5AXf7LJkGDbjYFNgFdF28
   FySieE2AmtkaunOkk7TpLoZCiQKh2AAT1sDHTaf4s9VwOSztdLEJ5urzd
   w820K6jrd3nN7FUvCsvTVeCoxXMnB9l+/Eg/fIeQKUaKsIPp1z+RlekIb
   H9kTod/fJhE5HFPl1lDwjZ2SdLXzzW6rJMJoXx6smPvqXlugJFUrO+Yu5
   I6oFuWS0Ka05OY5U2/Rorikik9JBNDbUATeI/TirOOVsbVoztlmZFLYBh
   g==;
X-CSE-ConnectionGUID: P1Vgzq5sSXmSZaEWnQ9QFA==
X-CSE-MsgGUID: T4q0JIUcTuagNF/bozRQMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1586915"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1586915"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 06:08:40 -0700
X-CSE-ConnectionGUID: WPJfuVH2T9KemX8Fn6EF/Q==
X-CSE-MsgGUID: WQwjSbfYR4+XaZgv0whvQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4296548"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 26 Oct 2026 06:08:38 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 52C2999; Mon, 26 Oct 2026 14:08:37 +0100 (CET)
Date: Mon, 26 Oct 2026 14:08:37 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Vlad Mykhailichenko <dywedir@gra.red>
Cc: linux-usb@vger.kernel.org, Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: ucsi_acpi: ThinkPad X13 Gen 1 (AMD) - VERSION reads 0, and
 GET_PDOS returns one PDO per command
Message-ID: <at9Q1fBiXFFr92AY@black.igk.intel.com>
References: <ea0ed395-47a3-4982-8eb7-54059726e6b7@gra.red>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ea0ed395-47a3-4982-8eb7-54059726e6b7@gra.red>

Hi Vlad,

On Tue, Oct 20, 2026 at 12:55:36PM +0300, Vlad Mykhailichenko wrote:
> Hi Heikki,
> 
> On a ThinkPad X13 Gen 1 (AMD Ryzen 5 PRO 4650U, 20UGS2K101, BIOS
> R1CET86W 1.55, 2026-05-08), UCSI never comes up, and once it is forced up it
> reports only the first source PDO. Seen on 6.18.56 and 7.2.10 (NixOS), with
> identical PPM responses on both. The relevant code in ucsi.c looks unchanged
> in current master (7.3).
> 
> 1) ucsi_acpi probe fails silently with -ENODEV
> 
> ucsi_acpi loads, USBC000:00 has _STA 0xF, but the device stays unbound and
> /sys/class/typec is empty. Nothing is logged, even with dyndbg=+p. A manual
> bind returns ENODEV:
> 
>   # echo USBC000:00 > /sys/bus/platform/drivers/ucsi_acpi/bind
>   echo: write error: No such device
> 
> USBC000:00 is not in devices_deferred. The silent path is the version check
> in ucsi_register():
> 
>   if (!ucsi->version)
>           return -ENODEV;
> 
> The firmware's SSDT (LENOVO UsbCTabl rev 1) declares the mailbox as
> \_SB.UBTC.USBC at 0xCC235000 (0x30 bytes; VER1, VER2, RSV1, RSV2, CCI0-3,
> CTL0-7, MGI0-F, MGO0-F). Its _DSM read path (ECRD) copies CCI and MGI from
> the
> EC. Nothing in any table writes VER1/VER2, so VERSION presumably stays 0
> unless the BIOS fills it during POST, which it evidently does not. I could
> not read the mailbox directly because of STRICT_DEVMEM.
> 
> As a workaround, an additional SSDT from the initrd (not a replacement of
> UsbCTabl) sets VERSION to 1.0 at load time:
> 
>   DefinitionBlock ("", "SSDT", 2, "WATTSN", "UcsiVer", 0x00000001)
>   {
>       External (\_SB.UBTC.VER1, FieldUnitObj)
>       External (\_SB.UBTC.VER2, FieldUnitObj)
> 
>       If (CondRefOf (\_SB.UBTC.VER2))
>       {
>           If (((\_SB.UBTC.VER1 == Zero) && (\_SB.UBTC.VER2 == Zero)))
>           {
>               \_SB.UBTC.VER2 = One
>           }
>       }
>   }
> 
> With that, ucsi_acpi binds, port0/port1 register and are linked to
> usb2/usb3-port1 and usb4/usb5-port1, and no PPM errors are logged. On 7.2.10
> the existing reserved-bit check also fires, so GET_CAPABILITY from the same
> firmware sets bit 7 of bNumConnectors as well (0x82 for 2 connectors):
> 
>   ucsi_acpi USBC000:00: UCSI: Invalid num_connectors 130. Likely buggy FW
> 
> 2) GET_PDOS returns a single PDO regardless of the number requested
> 
> With a 45 W USB PD charger on connector 2, the partner's source caps show
> only "1:fixed_supply 5000mV 3000mA". ucsi-source-psy-USBC000:002 reports
> voltage_now 0, current_now 2250000, current_max 3000000, voltage_min/max
> 5000000.
> 
> GET_PDOS via debugfs (partner, source, connector 2), one PDO at a time:
> 
>   offset 0  0x400820010 -> ...5383ff01 0801912c   fixed  5 V 3.00 A
>   offset 1  0x401820010 -> ...5383ff01 0002d12c   fixed  9 V 3.00 A
>   offset 2  0x402820010 -> ...5383ff01 0003c12c   fixed 12 V 3.00 A
>   offset 3  0x403820010 -> ...5383ff01 0004b12c   fixed 15 V 3.00 A
>   offset 4  0x404820010 -> ...5383ff01 000640e1   fixed 20 V 2.25 A
>   offset 5  0x405820010 -> ...5383ff01 c8dc325a   PPS 5.0-11.0 V 4.5 A
>   offset 6  0x406820010 -> ...5383ff01 00000000
> 
> Four at a time, only the first dword of the response is a valid PDO and the
> rest looks stale:
> 
>   offset 0  0x700820010 -> 0x01100200012000015383ff010801912c
>   offset 4  0x704820010 -> 0x01100200012000015383ff01000640e1
> 
> ucsi_get_pdos() reads one PDO, takes num_pdos < UCSI_MAX_PDOS as the end of
> the list, and stops. GET_CONNECTOR_STATUS shows the RDO selecting object
> position 5, operating current 2.25 A:
> 
>   0x20012 -> 0x0110020001200001538384e1202b5b60
> 
> so the contract is 20 V / 2.25 A, but the psy cannot report the voltage,
> because the kernel only has PDO 1.
> 
> Questions:
> 
> - Would a dev_err()/dev_warn() for the version == 0 case be acceptable? It
>   would have saved most of this.
> - For VERSION, is a DMI quirk that assumes 1.0 acceptable, or would you
> rather
>   this stays a firmware problem for Lenovo? Mark, is this something that can
>   be raised with the BIOS team?

This one really should be fixed in the firmware.

> - For GET_PDOS, would you take a fallback (or a quirk) that reads one PDO at
>   a time when a multi-PDO read returns exactly one?
> 
> I am happy to test patches on this machine.

And I would be happy to see patches. It sounds like you are capable
and willing to write the code, so just do it. That's how things are
proposed in Linux kernel - with code.

Thanks,

-- 
heikki
