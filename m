Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792490142;
	b=PsYtuS7pehj4/GUlbhPs6JxeaXdzvayLft2wB6Bxwdk/I7dLQg3UcAnESyNwC+J1gjsO
	 dFfmUCc/hI02lRzLKdMNzqRcLz6quylbiqI3tXPiNK/wAu0h1T3zbGyxn7PHES1ulddSc
	 lv/SDFPac8ClvyDxxLRYMjc3Gsi0k6SdbeYaNen6yEHMqry8FbV1BEVsXwhUfm3AloaTH
	 6WY8VfgAdFe0mWnOOL57DT48gcdsDr6U1A9F8RBFIOX65Vi3yBu7XdIsI4UonGhUvjgSq
	 xaRj+TENnwGeK3BZ7Pf1lJUlqe7Fedj7WyI/Sg0UwfJbVqZ0TtkSXC8vbHC8I3Nd9bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792490142;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Content-Language:To:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding;
	bh=+cbnxiAKt/WWE3E26Wh6+5ILmBzou2i/hmzwAjrTHQ8=;
	b=4/bAWTikUvAlxPz7DvqzBw6NtE1UWM8mG9h1i5borsF1gATjscc+H1Jn8emrdggXe1hz
	 uvsTnuBNxTYhcIKLsPfjJKQeJpU+N3VgOSLEJJ5WCjM/hbemaB8rN6rDsYaAR0D1Ofa5H
	 6NQVXp1LFPOkY5ePDLm/SelIbBHhigpeXufPE7QM/RiqObstkBHsRSgr5ZnDnS9eyR/eR
	 /IlGtwM4ZI/6fkdDQ7dFiZwsln5X0Fy3FS23UUq/abPjZy6J3i1zvw48dlCRrxvdsl0/A
	 ksRWONziB4/N2TjQoNz+v21W2pL1x9TJO99L6QiqsuBklmZafalsgbU69FMTF7ULu/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gra.red;
	spf=pass smtp.mailfrom=gra.red;
	dkim=pass header.d=gra.red header.i=@gra.red header.a=rsa-sha256 header.s=default header.b=mfGfH40q;
	arc=none smtp.remote-ip=95.215.58.46
Received: from mta1.migadu.com (out-46.mta1.migadu.com [95.215.58.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EDB60A2609
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 09:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84EDB60A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gra.red
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gra.red
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=gra.red header.i=@gra.red header.a=rsa-sha256 header.s=default header.b=mfGfH40q
X-Envelope-To: linux-usb@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=BKV/xyRLGMDNR8UeRTHuPC8F81p7YkKkbMzSUt8Ri+g=;
 c=simple/simple; d=gra.red;
 h=from:to:subject:date:message-id:mime-version:content-type; s=default;
 t=1792490139; v=1; x=1793094939;
 b=mfGfH40qiwlCpw4FWPaBQECEOgszC2wgLTg2liuW8159lalqx8mN15DgR7cCJJHE6QZR8RNk
 f6jJt9Gog0vPlmdgRs3FhhG5yI+SpkBS1vZljuKGkLyWfji5VgXepScA5OdVpgjev/W6ONgvcW7
 sI1Ps9vQ2Zj+jYXSkD18wSrk=
X-Envelope-To: linux-usb@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d27aadb386860bec;
	Tue, 20 Oct 2026 09:55:37 +0000
X-Mizu-Trace-ID: d27aadb386860bec
X-Migadu-Flow: FLOW_OUT
Message-ID: <ea0ed395-47a3-4982-8eb7-54059726e6b7@gra.red>
Date: Tue, 20 Oct 2026 12:55:36 +0300
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Mark Pearson <mpearson-lenovo@squebb.ca>
From: Vlad Mykhailichenko <dywedir@gra.red>
Subject: ucsi_acpi: ThinkPad X13 Gen 1 (AMD) - VERSION reads 0, and GET_PDOS
 returns one PDO per command
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Heikki,

On a ThinkPad X13 Gen 1 (AMD Ryzen 5 PRO 4650U, 20UGS2K101, BIOS
R1CET86W 1.55, 2026-05-08), UCSI never comes up, and once it is forced up it
reports only the first source PDO. Seen on 6.18.56 and 7.2.10 (NixOS), with
identical PPM responses on both. The relevant code in ucsi.c looks unchanged
in current master (7.3).

1) ucsi_acpi probe fails silently with -ENODEV

ucsi_acpi loads, USBC000:00 has _STA 0xF, but the device stays unbound and
/sys/class/typec is empty. Nothing is logged, even with dyndbg=+p. A manual
bind returns ENODEV:

   # echo USBC000:00 > /sys/bus/platform/drivers/ucsi_acpi/bind
   echo: write error: No such device

USBC000:00 is not in devices_deferred. The silent path is the version check
in ucsi_register():

   if (!ucsi->version)
           return -ENODEV;

The firmware's SSDT (LENOVO UsbCTabl rev 1) declares the mailbox as
\_SB.UBTC.USBC at 0xCC235000 (0x30 bytes; VER1, VER2, RSV1, RSV2, CCI0-3,
CTL0-7, MGI0-F, MGO0-F). Its _DSM read path (ECRD) copies CCI and MGI 
from the
EC. Nothing in any table writes VER1/VER2, so VERSION presumably stays 0
unless the BIOS fills it during POST, which it evidently does not. I could
not read the mailbox directly because of STRICT_DEVMEM.

As a workaround, an additional SSDT from the initrd (not a replacement of
UsbCTabl) sets VERSION to 1.0 at load time:

   DefinitionBlock ("", "SSDT", 2, "WATTSN", "UcsiVer", 0x00000001)
   {
       External (\_SB.UBTC.VER1, FieldUnitObj)
       External (\_SB.UBTC.VER2, FieldUnitObj)

       If (CondRefOf (\_SB.UBTC.VER2))
       {
           If (((\_SB.UBTC.VER1 == Zero) && (\_SB.UBTC.VER2 == Zero)))
           {
               \_SB.UBTC.VER2 = One
           }
       }
   }

With that, ucsi_acpi binds, port0/port1 register and are linked to
usb2/usb3-port1 and usb4/usb5-port1, and no PPM errors are logged. On 7.2.10
the existing reserved-bit check also fires, so GET_CAPABILITY from the same
firmware sets bit 7 of bNumConnectors as well (0x82 for 2 connectors):

   ucsi_acpi USBC000:00: UCSI: Invalid num_connectors 130. Likely buggy FW

2) GET_PDOS returns a single PDO regardless of the number requested

With a 45 W USB PD charger on connector 2, the partner's source caps show
only "1:fixed_supply 5000mV 3000mA". ucsi-source-psy-USBC000:002 reports
voltage_now 0, current_now 2250000, current_max 3000000, voltage_min/max
5000000.

GET_PDOS via debugfs (partner, source, connector 2), one PDO at a time:

   offset 0  0x400820010 -> ...5383ff01 0801912c   fixed  5 V 3.00 A
   offset 1  0x401820010 -> ...5383ff01 0002d12c   fixed  9 V 3.00 A
   offset 2  0x402820010 -> ...5383ff01 0003c12c   fixed 12 V 3.00 A
   offset 3  0x403820010 -> ...5383ff01 0004b12c   fixed 15 V 3.00 A
   offset 4  0x404820010 -> ...5383ff01 000640e1   fixed 20 V 2.25 A
   offset 5  0x405820010 -> ...5383ff01 c8dc325a   PPS 5.0-11.0 V 4.5 A
   offset 6  0x406820010 -> ...5383ff01 00000000

Four at a time, only the first dword of the response is a valid PDO and the
rest looks stale:

   offset 0  0x700820010 -> 0x01100200012000015383ff010801912c
   offset 4  0x704820010 -> 0x01100200012000015383ff01000640e1

ucsi_get_pdos() reads one PDO, takes num_pdos < UCSI_MAX_PDOS as the end of
the list, and stops. GET_CONNECTOR_STATUS shows the RDO selecting object
position 5, operating current 2.25 A:

   0x20012 -> 0x0110020001200001538384e1202b5b60

so the contract is 20 V / 2.25 A, but the psy cannot report the voltage,
because the kernel only has PDO 1.

Questions:

- Would a dev_err()/dev_warn() for the version == 0 case be acceptable? It
   would have saved most of this.
- For VERSION, is a DMI quirk that assumes 1.0 acceptable, or would you 
rather
   this stays a firmware problem for Lenovo? Mark, is this something 
that can
   be raised with the BIOS team?
- For GET_PDOS, would you take a fallback (or a quirk) that reads one PDO at
   a time when a multi-PDO read returns exactly one?

I am happy to test patches on this machine.

Thanks,
Vlad Mykhailichenko

