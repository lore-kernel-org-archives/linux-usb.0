Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB77D35677A
	for <linux-usb@vger.kernel.org>; Fri, 12 Jun 2026 05:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781242346; cv=pass; b=eqLcjR3vI++RmYLHXjATG43z0FNTr928ccNL/MvXk2TZ3kzjC3+cHlUbceo8YyU86j88UBCVncAojGkkgP5BbJYbsGjubdFAattjwfb38xzdBW+Ve96mtUSWnN8krdS123ysLhe/nwv/ndjpe8ZxXoa4emDeKXk6uVGEVnt8u8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781242346; c=relaxed/simple;
	bh=ueSr09QOvfze5E1YA9MXnriLEb6WfMSlYQ4BR714z08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gl8Ol6hlr0fvMncvxdiFrvrWwp3SoM1Vz0Uhpm1yYUyAZSevLZfmaD408HFEIOg489ZorLYo3MMoUbIMr/u80jEb9/hP7NCIzI11VpK0+C0ldLQbzLNhvhXoVBzp0dMSIZ6ZtXtFPKhWsR1bjRp1PtYu8T7F0WBI713iIj4Bzzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=canonical-com.20251104.gappssmtp.com header.i=@canonical-com.20251104.gappssmtp.com header.b=O0lQBVzo; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical-com.20251104.gappssmtp.com header.i=@canonical-com.20251104.gappssmtp.com header.b="O0lQBVzo"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aa66893e9fso230815e87.1
        for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 22:32:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781242342; cv=none;
        d=google.com; s=arc-20240605;
        b=Prvhubm/+x+3I7Jbbn5Ae5T2+JqcRTus752oeyt+KN258Muoh+OFDrguFJdtFgPAbb
         s80yn7DrKw5/EIRqZmAe7DBw9S2hhYRMnK4U95z7v1rSZ8obkD67FOCkO4Uw51LtQfnG
         bQUllhDGSiPtG3WWkXLvIYhOXUghY4EPAF2xVz/vsrhuBK22hBQapeofJC/CHX/uvRml
         zJkg9W6iofmp8LniVfBtfb72UhS8eGbU9ekdkavZDAdDAz0meZKD97TcxEVd3pBr/q3G
         u4oad5RP+yCyCl71yFU+ODk5U1/2SgfZjSRIBGIKfAcW/nJT237URI7YKoJ87zagnjLG
         7tEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e+0/5UJw4ypA9BGEAqw/Dcyn8vSWJwseZvOTRoSsZnA=;
        fh=riw2uZ+Qvqhdq6LWuOZvpgoncRn6XZ5zbNTTpH8ONGI=;
        b=hUmaUQdUFny/EPl9U1KPc5dTkohu2YUlRUq7NjcW1Cf8BspDlP4zFJkJSN4UhXcYW7
         aMoYj/sNkpK4SFKC9r24qmRLesOqug6sQyi9T5BCvHQWTTczI5SGNv/s2SYQVkHVs6K2
         g2rhAUk5X+JpFmJgkoDFRifMsgZEvAYkvkHac9ShkSVzjDwWzVY16mtsDxOX416V8oDq
         QUAyFVP+irsq54qEG4KGG3LD1d0P6oz2JxgMxSoQkgRUS6ELSK27kTgPZjj3TqccqGbj
         nQF/EOHZCNGSBlIZsTy0iIGMsDdoNIkE3Wa/Oco+43M7sq6CQF87vdQc+kdWekzghGMx
         46jQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=canonical-com.20251104.gappssmtp.com; s=20251104; t=1781242342; x=1781847142; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+0/5UJw4ypA9BGEAqw/Dcyn8vSWJwseZvOTRoSsZnA=;
        b=O0lQBVzog6QFcC8/9FRtOEy6MAtmdQjGxkPxwgptXeFQFFT8214Jk8N8Z8SFak+ZEp
         /+uoK4ywHg3/xN/Se6ZgKMQrlgMBkF7lbAUOoneJOPAnfAIWmwoxJjw3004cVMk+XdPU
         Y1XaozmMLPGQdWz3TXMisLAbH4OovwKy4aZlh263xdcVeES6KPkJephRQgPP8qYukAsK
         nn3IBTeQXASrNQdsRe9JikYqrPUvia+bBuF/ZZJUxhjeQ3OJpceDYStfUn8yTWF0Q8ZK
         scdJk/mnKxG6khnA3wAKnemUhRKUEb4ZGGiHTZAkumfvGmXqFUgSlooO3WFPIl7VDVzP
         et4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781242342; x=1781847142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e+0/5UJw4ypA9BGEAqw/Dcyn8vSWJwseZvOTRoSsZnA=;
        b=IakkbJI3bDNO8FMKjuYvVZf3aul65OZnHdd62/4CMcNDCt+XqG2jjKpn5ix27ZnJ+g
         vwVqQO/NMZHQ4ogPplN/st6x9gwrOOs7vfbi2vJ3qS/TVxMHuAiZB7OEcgHzb4Shjjuw
         Bi5juumFc3ukjT24EFXW96HJABi7vLtsZiLzoUcu29HA/LYRHV01BUgWl84Uc7TcgYU2
         8tQ5zRB4WiboZn4FVVIb4/1bO+ZeSEhWL3/wWv5yH1YrxbUqr75V+Vd63DrGx1Oy52dv
         0YaoJ1ZrakBdhwnCKade8mnJ34v/E2tML+EZZMw4Nh0x5IBdQTeqUqntNt7u88UMRBQ7
         qxgQ==
X-Forwarded-Encrypted: i=1; AFNElJ/MGVR9fEKoQjbP5Mp9sDa2fq6DGgBi7KK/5c8sP6Q8tD8+C+4qY0EJGhMMHEYbtFBBGRY0HQaYdtM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUhCX3DYcRstmUKfbbCbihkmbHl8oT4NRrBROgibgZZlOQ6AA4
	9ddDZ6169XxcPqJaIhbfuR5o1Bw+tZzQPj5P9XgCcF/WmO8W88bAo/PCSGXaUudgNU8LhVOiCki
	cSCEi+9ghsfpOQNUmMMSBxSSlSsO8PWk=
X-Gm-Gg: Acq92OHJ7z/5IkRIqnnO3Es0qNl63/QlhWCfUJO405FGUyx0Qnk1EEix8G2bLqD8fI8
	K8AROs9kxHjIR/mboLZkrzE/Zr5h5fW7CcQST39ofWcajtO40Pjy8z1rRDoiXMxLhMYaJsqxznx
	PAcUSeQZ4ROY5soH02x2vGy1f/7E6rA0C1muCB7mLWzeaDG7IkBT2lv02Es0PBO93iRWj1dc6dW
	HADRlhw1cVIGn3+b1gK26SWiyr8RHG75AmhWqiLPJSmKVXCWoBsagKkdrTk5t2ArAu+eh+/Ib/j
	1Us3cwfJVeGYvGj0/DQ=
X-Received: by 2002:ac2:4f15:0:b0:5aa:6aba:76f8 with SMTP id
 2adb3069b0e04-5ad2db68ab3mr413087e87.30.1781242341698; Thu, 11 Jun 2026
 22:32:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612052112.1325812-1-acelan.kao@canonical.com>
In-Reply-To: <20260612052112.1325812-1-acelan.kao@canonical.com>
From: AceLan Kao <acelan.kao@canonical.com>
Date: Fri, 12 Jun 2026 13:32:09 +0800
X-Gm-Features: AVVi8Cd4nkD3fheKFxScE4TUv20ghKR8TRv4sckoARZi5P8smZWwDMEg_vCV6Nw
Message-ID: <CAMz9Wg_8BeZ8MbYUWMZgpxyui2MyXQvXiF028xEZ9=69Ph3VDg@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] usb: typec: ucsi: Filter duplicate altmodes from
 buggy firmware
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: bleung@chromium.org, jthies@google.com, myrrhperiwinkle@qtmlabs.xyz, 
	pooja.katiyar@intel.com, abelvesa@kernel.org, yuanhsinte@chromium.org, 
	johan@kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

My email got rejected by some developers, so I manually reply to see
if it works.

Chia-Lin Kao (AceLan) <acelan.kao@canonical.com> =E6=96=BC 2026=E5=B9=B46=
=E6=9C=8812=E6=97=A5=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=881:21=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> Some UCSI firmware implementations return the same altmode multiple
> times when queried with UCSI_GET_ALTERNATE_MODES.  When the resulting
> duplicate partner altmodes reach the typec class, two altmodes with the
> same SVID end up matched to the same port-side altmode by
> altmode_match()/device_find_child(), and the second registration
> collides on /sys/.../portN.M/partner with a sysfs duplicate-filename
> error and a probe failure (visible as a kernel call trace from
> typec_altmode_create_links()).
>
>   sysfs: cannot create duplicate filename '/devices/.../typec/port0/port0=
.0/partner'
>   typec-thunderbolt port0-partner.1: failed to create symlinks
>   typec-thunderbolt port0-partner.1: probe with driver typec-thunderbolt =
failed with error -17
>
> This series teaches ucsi_register_altmodes() and
> ucsi_register_altmodes_nvidia() to filter these duplicates before they
> hit the typec class, replacing the call trace with a single dev_warn().
> It also retires the open-coded workaround that ucsi_yoga_c630.c was
> using for the same firmware bug now that the core handles it.
>
> The matching rules differ by recipient, because the pairing semantics
> in the typec class differ:
>
>   - UCSI_RECIPIENT_CON  (port) and
>     UCSI_RECIPIENT_SOP_P (plug):
>     Drop only byte-for-byte duplicates (same SVID and same VDO);
>     a second copy adds nothing.
>
>   - UCSI_RECIPIENT_SOP  (partner):
>     A partner altmode is paired with a port altmode of the same SVID
>     via altmode_match()/device_find_child(), which returns the first
>     port altmode with the matching SVID.  The number of partner
>     altmodes that can coexist for a given SVID is therefore bounded
>     by the number of port altmodes the firmware advertises for that
>     SVID.  Use that port-side count as the cap and reject any partner
>     altmode that would exceed it.
>
> Why cardinality and not just SVID+VDO?  A plain SVID+VDO comparison is
> too lax for the partner case: real firmware in the wild reports two
> "partner" Thunderbolt altmodes (SVID 0x8087) with different VDOs while
> the port side only advertises one, and both would still collapse onto
> the same port altmode and trip the sysfs collision.  A plain SVID
> comparison is the other extreme: it would falsely drop the second mode
> of vendor SVIDs that the port really does advertise twice (for example,
> Dell's 0x413c which legitimately registers as port1.1 and port1.2 with
> two distinct VDOs).  The cardinality cap captures both cases correctly
> and is consistent with how the typec class actually pairs altmodes.
>
> Tested on two Dell platforms:
>
>   * Dell platform A: firmware reports two partner altmodes for SVID
>     0x8087 (Thunderbolt) against a single port-side 0x8087, and the
>     same port also advertises two distinct 0x413c altmodes
>     (port1.1 and port1.2) paired with two 0x413c partner altmodes.
>     Before: sysfs duplicate-filename error and probe failure on
>     portN-partner.1 / typec-thunderbolt.
>     After: the surplus 0x8087 partner altmode is dropped with a
>     clean dev_warn(); typec-thunderbolt probes once and the dock
>     works, and both legitimate 0x413c partner altmodes still
>     register as portN-partner.1 and portN-partner.2.  DisplayPort
>     (0xff01) is unaffected.
>
>   * Dell platform B: firmware reports a single 0x8087 partner
>     altmode matching its single port-side 0x8087 (no firmware bug
>     present).  Used as a regression-check baseline.
>     After: behaviour unchanged; no altmodes are spuriously dropped.
>
> v5 -> v6:
>   - Replace the partner-side SVID+VDO duplicate check with a
>     cardinality cap: skip a partner altmode for SVID X once the
>     number of already-registered partner altmodes for X has reached
>     the number of port altmodes for X.  This is the only rule that
>     is consistent with how the typec class pairs partner-to-port
>     altmodes, and is the change that actually fixes the Thunderbolt
>     case while keeping the Dell case working.
>   - Add a small ucsi_altmode_count_svid() helper used by the
>     cardinality check.
>   - Move the recipient-name table into ucsi_dump_duplicate_altmode()
>     as a function-local static const; it has no other users.
>   - Expand the kernel-doc block on ucsi_altmode_is_duplicate() to
>     document the per-recipient rules and the rationale.
>   - Reword patch 3/3 to use the canonical 'commit <sha12> ("<title>")'
>     style for the reference to the original yoga_c630 workaround.
>   - Tested on the two platforms described above (TBT firmware bug
>     machine and Dell multi-Mode 0x413c machine); no regression on
>     either, call trace gone on the TBT machine.
>
> v4 -> v5:
>   - Add ucsi_dump_duplicate_altmode() helper to consolidate the
>     duplicate-detected dev_warn() output; all three previous
>     open-coded warning callsites (batch-internal, partner already
>     registered, port/plug already registered) route through it.
>   - Add ucsi_recipient_names[] lookup table and use it in the new
>     helper instead of repeating the switch over recipient values
>     inside ucsi_altmode_is_duplicate() and the warning strings.
>     (v6 later moves this table into the helper itself as a
>     function-local static const; see "Changes since v5".)
>   - Split the user-visible warning into two shorter lines:
>       "Firmware bug: duplicate <recipient> altmode SVID 0xNNNN at
>        offset N, ignoring."
>       "VDO mismatch: 0xNNNNNNNN vs 0xNNNNNNNN" (only emitted when
>       the two VDOs actually differ).
>     The previous single line ran past 75 chars and embedded the
>     VDOs and a "Please update your system firmware." trailer.
>
> v3 -> v4:
>   - Rebased onto the latest tree.
>
> v2 -> v3:
>   - Move ucsi_altmode_is_duplicate() above
>     ucsi_register_altmodes_nvidia() so the nvidia path can call it
>     too (groundwork for the nvidia-path fix that later lands as
>     patch 2/3).
>   - Use struct typec_altmode ** to walk the already-registered
>     altmode arrays (port_altmode / partner_altmode / plug_altmode)
>     instead of three separate branches; simplifies the dedup logic.
>
> v1 -> v2:
>   - Split the single patch into a 3-patch series:
>       1/3 core helper + standard registration path,
>       2/3 same dedup applied in the nvidia registration path so
>           all drivers benefit, not just those on the standard path,
>       3/3 retire the open-coded duplicate filter in ucsi_yoga_c630.c
>           now that the core covers it.
>   - Extend ucsi_altmode_is_duplicate() to cover all three recipient
>     types (CON / SOP / SOP_P), not just SOP.
>   - Improve the warning message to also include the differing VDOs
>     when a partner altmode collides on SVID with a different VDO,
>     so the firmware bug is actually diagnosable from dmesg.
>   - Print a single dev_warn() per skipped altmode instead of letting
>     the registration path generate a sysfs duplicate-filename call
>     trace.
>
> Previous revisions:
>   [v1] https://lore.kernel.org/lkml/20251016055332.914106-1-acelan.kao@ca=
nonical.com/
>   [v2] https://lore.kernel.org/lkml/20251111010541.145421-1-acelan.kao@ca=
nonical.com/
>   [v3] https://lore.kernel.org/lkml/20251224070022.4082182-1-acelan.kao@c=
anonical.com/
>   [v4] https://lore.kernel.org/lkml/20260413073552.894395-1-acelan.kao@ca=
nonical.com/
>   [v5] https://lore.kernel.org/lkml/20260504115927.48925-1-acelan.kao@can=
onical.com/
>
> Some UCSI firmware implementations return the same altmode multiple
> times when queried with UCSI_GET_ALTERNATE_MODES.  When the resulting
> duplicate partner altmodes reach the typec class, two altmodes with the
> same SVID end up matched to the same port-side altmode by
> altmode_match()/device_find_child(), and the second registration
> collides on /sys/.../portN.M/partner with a sysfs duplicate-filename
> error and a probe failure (visible as a kernel call trace from
> typec_altmode_create_links()).
>
>   sysfs: cannot create duplicate filename '/devices/.../typec/port0/port0=
.0/partner'
>   typec-thunderbolt port0-partner.1: failed to create symlinks
>   typec-thunderbolt port0-partner.1: probe with driver typec-thunderbolt =
failed with error -17
>
> This series teaches ucsi_register_altmodes() and
> ucsi_register_altmodes_nvidia() to filter these duplicates before they
> hit the typec class, replacing the call trace with a single dev_warn().
> It also retires the open-coded workaround that ucsi_yoga_c630.c was
> using for the same firmware bug now that the core handles it.
>
> The matching rules differ by recipient, because the pairing semantics
> in the typec class differ:
>
>   - UCSI_RECIPIENT_CON  (port) and
>     UCSI_RECIPIENT_SOP_P (plug):
>     Drop only byte-for-byte duplicates (same SVID and same VDO);
>     a second copy adds nothing.
>
>   - UCSI_RECIPIENT_SOP  (partner):
>     A partner altmode is paired with a port altmode of the same SVID
>     via altmode_match()/device_find_child(), which returns the first
>     port altmode with the matching SVID.  The number of partner
>     altmodes that can coexist for a given SVID is therefore bounded
>     by the number of port altmodes the firmware advertises for that
>     SVID.  Use that port-side count as the cap and reject any partner
>     altmode that would exceed it.
>
> Why cardinality and not just SVID+VDO?  A plain SVID+VDO comparison is
> too lax for the partner case: real firmware in the wild reports two
> "partner" Thunderbolt altmodes (SVID 0x8087) with different VDOs while
> the port side only advertises one, and both would still collapse onto
> the same port altmode and trip the sysfs collision.  A plain SVID
> comparison is the other extreme: it would falsely drop the second mode
> of vendor SVIDs that the port really does advertise twice (for example,
> Dell's 0x413c which legitimately registers as port1.1 and port1.2 with
> two distinct VDOs).  The cardinality cap captures both cases correctly
> and is consistent with how the typec class actually pairs altmodes.
>
> Tested on two Dell platforms:
>
>   * Dell platform A: firmware reports two partner altmodes for SVID
>     0x8087 (Thunderbolt) against a single port-side 0x8087, and the
>     same port also advertises two distinct 0x413c altmodes
>     (port1.1 and port1.2) paired with two 0x413c partner altmodes.
>     Before: sysfs duplicate-filename error and probe failure on
>     portN-partner.1 / typec-thunderbolt.
>     After: the surplus 0x8087 partner altmode is dropped with a
>     clean dev_warn(); typec-thunderbolt probes once and the dock
>     works, and both legitimate 0x413c partner altmodes still
>     register as portN-partner.1 and portN-partner.2.  DisplayPort
>     (0xff01) is unaffected.
>
>   * Dell platform B: firmware reports a single 0x8087 partner
>     altmode matching its single port-side 0x8087 (no firmware bug
>     present).  Used as a regression-check baseline.
>     After: behaviour unchanged; no altmodes are spuriously dropped.
>
> v5 -> v6:
>   - Replace the partner-side SVID+VDO duplicate check with a
>     cardinality cap: skip a partner altmode for SVID X once the
>     number of already-registered partner altmodes for X has reached
>     the number of port altmodes for X.  This is the only rule that
>     is consistent with how the typec class pairs partner-to-port
>     altmodes, and is the change that actually fixes the Thunderbolt
>     case while keeping the Dell case working.
>   - Add a small ucsi_altmode_count_svid() helper used by the
>     cardinality check.
>   - Move the recipient-name table into ucsi_dump_duplicate_altmode()
>     as a function-local static const; it has no other users.
>   - Expand the kernel-doc block on ucsi_altmode_is_duplicate() to
>     document the per-recipient rules and the rationale.
>   - Reword patch 3/3 to use the canonical 'commit <sha12> ("<title>")'
>     style for the reference to the original yoga_c630 workaround.
>   - Tested on the two platforms described above (TBT firmware bug
>     machine and Dell multi-Mode 0x413c machine); no regression on
>     either, call trace gone on the TBT machine.
>
> v4 -> v5:
>   - Add ucsi_dump_duplicate_altmode() helper to consolidate the
>     duplicate-detected dev_warn() output; all three previous
>     open-coded warning callsites (batch-internal, partner already
>     registered, port/plug already registered) route through it.
>   - Add ucsi_recipient_names[] lookup table and use it in the new
>     helper instead of repeating the switch over recipient values
>     inside ucsi_altmode_is_duplicate() and the warning strings.
>     (v6 later moves this table into the helper itself as a
>     function-local static const; see "Changes since v5".)
>   - Split the user-visible warning into two shorter lines:
>       "Firmware bug: duplicate <recipient> altmode SVID 0xNNNN at
>        offset N, ignoring."
>       "VDO mismatch: 0xNNNNNNNN vs 0xNNNNNNNN" (only emitted when
>       the two VDOs actually differ).
>     The previous single line ran past 75 chars and embedded the
>     VDOs and a "Please update your system firmware." trailer.
>
> v3 -> v4:
>   - Rebased onto the latest tree.
>
> v2 -> v3:
>   - Move ucsi_altmode_is_duplicate() above
>     ucsi_register_altmodes_nvidia() so the nvidia path can call it
>     too (groundwork for the nvidia-path fix that later lands as
>     patch 2/3).
>   - Use struct typec_altmode ** to walk the already-registered
>     altmode arrays (port_altmode / partner_altmode / plug_altmode)
>     instead of three separate branches; simplifies the dedup logic.
>
> v1 -> v2:
>   - Split the single patch into a 3-patch series:
>       1/3 core helper + standard registration path,
>       2/3 same dedup applied in the nvidia registration path so
>           all drivers benefit, not just those on the standard path,
>       3/3 retire the open-coded duplicate filter in ucsi_yoga_c630.c
>           now that the core covers it.
>   - Extend ucsi_altmode_is_duplicate() to cover all three recipient
>     types (CON / SOP / SOP_P), not just SOP.
>   - Improve the warning message to also include the differing VDOs
>     when a partner altmode collides on SVID with a different VDO,
>     so the firmware bug is actually diagnosable from dmesg.
>   - Print a single dev_warn() per skipped altmode instead of letting
>     the registration path generate a sysfs duplicate-filename call
>     trace.
>
> Previous revisions:
>   [v1] https://lore.kernel.org/lkml/20251016055332.914106-1-acelan.kao@ca=
nonical.com/
>   [v2] https://lore.kernel.org/lkml/20251111010541.145421-1-acelan.kao@ca=
nonical.com/
>   [v3] https://lore.kernel.org/lkml/20251224070022.4082182-1-acelan.kao@c=
anonical.com/
>   [v4] https://lore.kernel.org/lkml/20260413073552.894395-1-acelan.kao@ca=
nonical.com/
>   [v5] https://lore.kernel.org/lkml/20260504115927.48925-1-acelan.kao@can=
onical.com/
>
> Chia-Lin Kao (AceLan) (3):
>   usb: typec: ucsi: Detect and skip duplicate altmodes from buggy
>     firmware
>   usb: typec: ucsi: Add duplicate detection to nvidia registration path
>   usb: typec: ucsi: yoga_c630: Remove redundant duplicate altmode
>     handling
>
>  drivers/usb/typec/ucsi/ucsi.c           | 158 ++++++++++++++++++++++--
>  drivers/usb/typec/ucsi/ucsi_yoga_c630.c |  23 ----
>  2 files changed, 148 insertions(+), 33 deletions(-)
>
>
> base-commit: ec039126b7fac4e3af35ebccaa7c6f9b6875ba81
> --
> 2.53.0
>


--=20
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
