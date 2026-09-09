Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD39480348
	for <linux-usb@vger.kernel.org>; Wed,  9 Sep 2026 13:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788960329; cv=pass; b=qbPHWFQ3yA+QnxPJnqpK6KQD9jC+hAU+8zcIPo+2p6JJRf+eHitaTVCfA4s+SLKVGTeCYlVQx3tQYFtVp3GkJQWOA5u2DNK37Pl22JWbbFdcHLMeMy8aO69j39eupyTSnZ8jo3h6fQxq2Y9Xm2GZWyeRcVlNAmWXvOUEq97LNwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788960329; c=relaxed/simple;
	bh=BSF270y4a3n3SUnBFtCp+QyH2P6Z37J67eXwZPBgtPc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=pErC1QL9Gi5957aadKoo4L9bjFmgo5D5+A7uIg9Aspt0wUbLgMG2FYxCuPa7YGRO3fAjetwlxTGyigwjn1JQPRwIQu9eyL5s0HKnTXLnD6Bn5qD5UR/KWlDYEbJXzCj9zEqGaN9ULgbobSO1FxG+lBwBkb78nTQfkP/coO8X4Y4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=dbmlwX9v; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="dbmlwX9v"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb751so1024508a91.2
        for <linux-usb@vger.kernel.org>; Wed, 09 Sep 2026 06:25:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788960322; cv=none;
        d=google.com; s=arc-20260327;
        b=M+c3m2tgml28nUlhaluBnxVJcGY1S5ULJBMhAOCWnc+q9jYgMic6UiafTbn2RD+5Md
         gsGHwWd+/6Q7wgIYxjfN+v4qcs/jYBkDBx9LyCSAvfmGrFzv2LGnMXVjgXgIt0Hn+vYC
         5xloxovRA0xsVESQH21FsCPoHZEGdsY4LFX+PAJDVBY0nYO3qkxVlDMTewOPrtJs5YfQ
         hucWbC2R4BFd6X20bt/lXolwrxmS+51bT3Iesl7SUmV6t/7egMdCQybzwCVZBSzTF77B
         Duk4dyplKme2HK3ZIKyUS2W2ay+GFNUsahHVGG6rLJxN+JB/OWFsxMIR5QxtviKif3Jt
         fQIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=qqzWjE6XpE/AfJ8afs4edymVdgya1i/b4rSycIvpFs8=;
        fh=5legqzeFyxZP0u+NR0Livgjpr6I9KJ7YQMQkjl4psyM=;
        b=U4b/Bx6zXXT55WUegBhwrzRrOgu/9rCnPmuTg3Jm9xbJdTFSRR9NNnORzschzbP3Xt
         lWrjtWN54xcHM79rN0TNb6gYDMJytrzp1mbm9wTauGHwGY1VgiR1hy3ey5QzNX78rhh5
         fdDBIbsho3imEkLMmnddho9AOOOjdFRhpkQKNYts+d59f0qyL/NZ0tOW9z0XX19aJJ18
         edmwH4J3g1AsYC2Yc7Gori3rE2s/fOMhfAT8VgtMkMZkR4N8s5MWMWNmTQiymF6elZuq
         CzbfYuctxJ1/nSyxF+Fu99i7Zfn44p1koX5hbAb9xqPj++WOyfSm1vwqSlFgACOk4grK
         WsBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1788960322; x=1789565122; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qqzWjE6XpE/AfJ8afs4edymVdgya1i/b4rSycIvpFs8=;
        b=dbmlwX9vTGiP5vhP483d5jG+P++MgECHU/QudYVri25K4gi4WDb2zCt+oPzq2h69P4
         OdaVnAveQul2VtEA8NzOmqeR9ON+nWCgL7BmnBZiZZ0tRZVkUDyOcKtzo7Xz4TvPDfnx
         qbQ6CQ/bi64MygaK/ipY3Clboe7ZeFUb3zQqGtLleI05JNYbB6PFc+ScvD8rxjMH6NwH
         v12ekEBQfrLFRA0gfWFtsbF1wHuyStxPhEJmwEZm1DLESfOSJ4WvaPrRHT6kqZvEonfA
         no+JtTMogR2aVX8UGdwy8IexwHZwEq4Ypq1OIZb6Q9EKBNGw8InZSm/74LiYuFqy+6ay
         IDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788960322; x=1789565122;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qqzWjE6XpE/AfJ8afs4edymVdgya1i/b4rSycIvpFs8=;
        b=F4G+pY+dK9jKF2v0V5v4dafac0lHdedhXpLsfQC4JsuCrJXkQBEJqrB8XS1YvLerNq
         9W9i4ivyo0dNkyNaCZNCvScGzPHOrUEb1GGCpo3K5HeM73BRhG7sF6sNrORVM3Q6+dPw
         wGlpkq5ko5291WW+NutrAcOc4WZrweeIo6JNFY0I5RrHoYBU57/YuFdCaXBDGA3M1N+U
         3/XT9Ysiuj0Aq7pq+Dt0vMkB6/aELD4aWIMub+yqzQZDYwbKXvUh/eGuKoWR3dZOOOc8
         +E2DWFuId0tgnb/I22IlTrslMnbctO4jk8GkOknP8hJ/kVcrEQ+vyUByMmmqRLdaGFTc
         lJ9w==
X-Gm-Message-State: AFuF++mjTn+cSEqu4niOFX00Ob1khVVpGPrv58mxnC8UF/wqFwy6i+5Z
	nWc0xbByX6bqIS6F44a1S0IINZhMVghPMymPoyf9fvzql6UIR1Fh25LDOjdsCW0mboBiKasxCf/
	VuxXWgLYQ2v1r5HAPQsozH9elLMYNBsFKxoSB
X-Gm-Gg: AYBFou0sQgx2az6Ff6PoPjA/bwV6Lq4+ehYhbjzeWw1RlWwtAke+AfeUTGdbzbPgjRK
	QXJ1/2mRkewmwlt2m6DaXjLv4kyK82jLQb4ZtYx0yGeYNKjrR/PB1W7tMdSMesH67x2zvpNyMJf
	yZ770YglOAxAIaSlIOzG3C/2gItd8iadtg9rt8qDjtbz7f/+tQo61NRca3TO4W2hp0g2JWBbPE6
	fqWM1HsFdQKd9mYZAGpzZ8n27lBAyUfbnQLqq6qjUIjMNZAbXLPR0DaqViNkmXBaDuMxov/yquy
	vzRshzpk4s8V/WWEBWlnen1a/H9InL46JE3xohFxEcjmomzcn0Kv/whtFVro+POBI8Y67G2kdQd
	KBQ2YJp9nsdE=
X-Received: by 2002:a17:90b:17c2:b0:398:9be8:ea6a with SMTP id
 98e67ed59e1d1-39bac4571cfmr7550954a91.23.1788960322240; Wed, 09 Sep 2026
 06:25:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Manuel Knitza <manuel.knitza@googlemail.com>
Date: Wed, 9 Sep 2026 15:25:11 +0200
X-Gm-Features: AcwNN1XhulGopQnxFYFGG0MsXxbcBJQgHCLp7e501vn6fuIz4zkF6VXI9IcXYRA
Message-ID: <CAMRbua4xZfsQ0FXsrfq=SCbyZa1n=Aw5UrD3bEaU41d+J3KmXw@mail.gmail.com>
Subject: =?UTF-8?Q?=5BBUG=5D_ucsi=3A_duplicate_partner_altmode_=E2=80=94_the_invali?=
	=?UTF-8?Q?d_VDO_wins=2C_DP_Alt_Mode_never_works?=
To: linux-usb@vger.kernel.org
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

on a Dell XPS 16 DA16260 (Panther Lake, BIOS 1.10.1) the UCSI firmware
reports the
DisplayPort alternate mode twice with conflicting VDOs. The kernel
keeps the first entry
and discards the second =E2=80=94 but here the first is the malformed one, =
and
the result is that
DisplayPort Alt Mode never works on any port when a plain USB-C=E2=86=92DP
adapter is hotplugged.

>     ucsi_acpi USBC000:00: con2: Firmware bug: duplicate partner altmode S=
VID 0xff01 at
>         offset 1, ignoring but please contact the BIOS vendor to fix this=
 issue.
>     ucsi_acpi USBC000:00: con2: VDO mismatch: 0xff01a843 vs 0x40101407


Identical output on con3. Reproduced on 7.1.8 and 7.2.3.

The firmware is clearly at fault and the message says so. My point is
a different one: of
the two VDOs the firmware offers, one is usable and the kernel
systematically picks the
other, turning a firmware quirk into a total loss of function.

> Retained  0xff01a843 =E2=80=94 top 16 bits are 0xff01, i.e. the SVID itse=
lf, apparently packed
>                        into the VDO field by the firmware. Parsed as a DP=
 VDO this
>                        advertises only pin assignments D and F (2 lanes).
> Discarded 0x40101407 =E2=80=94 well-formed DP Alt Mode VDO: DFP_D + UFP_D=
, DPv1.3 signalling,
>                        UFP_D pin assignments C and E (4 lanes).


The adapter itself is not the source of the duplicate. Its USB
Billboard descriptor
declares exactly one alternate mode:

>     Billboard capability: supported alt modes =3D 1, preferred =3D 0
>       [0] SVID =3D 0xff01
>     Billboard AltMode capability: dwAltModeVdo =3D 0x40101007


So the device offers a single, valid DP VDO; the duplication and the
corrupted variant are
produced on the UCSI/PPM side.

Consequences with the malformed VDO retained:

  - /sys/class/typec/portX-partner/portX-partner.0/displayport/pin_assignme=
nt
shows "D F",
    never C or E, so even a working link could not carry 4 lanes.
  - hpd stays 0; the sink is never seen.
  - Writing to .../displayport/pin_assignment fails with
      typec_displayport portX-partner.0: firmware doesn't support
alternate mode overriding
    so userspace cannot correct it either.

Interestingly the hardware path is fine: if the same adapter is
already connected at boot,
the display comes up at full 5120x2160@60, port_clock 810000 (HBR3),
lane_count 4, bpp 24.
Only the hotplug path, which goes through UCSI, fails. That reinforces
that the platform
can do 4-lane DP and only the altmode bookkeeping is wrong.

Would it be reasonable for ucsi_altmode_is_duplicate() /
ucsi_register_altmode() to prefer
a VDO that parses as valid for the given SVID over one that does not,
instead of keeping
whichever arrived first? For DP Alt Mode a cheap sanity check exists =E2=80=
=94
a VDO whose upper
bits repeat the SVID, or which advertises no pin assignment usable by
the port, is not a
plausible descriptor. Keeping the current warning would still tell the
user their firmware
is broken, while not letting it break the port.

I am happy to test patches; the machine reproduces this on every hotplug.

Relevant symbols in the module: ucsi_altmode_is_duplicate,
ucsi_register_altmode,
ucsi_register_altmodes, ucsi_check_altmodes, ucsi_dump_duplicate_altmode.

Full message text for reference:
    "con%d: Firmware bug: duplicate %s altmode SVID 0x%04x at offset
%d, ignoring but
     please contact the BIOS vendor to fix this issue."
    "con%d: VDO mismatch: 0x%08x vs 0x%08x"

--

A second, probably unrelated observation on the same machine,
mentioned only in case it
rings a bell: ucsi_acpi frequently fails at boot with

    ucsi_acpi USBC000:00: con1: failed to register alt modes
    ucsi_acpi USBC000:00: error -ETIMEDOUT: PPM init failed

after which /sys/class/typec/ is empty for the rest of the session.
Reloading the module
("modprobe -r ucsi_acpi && modprobe ucsi_acpi") brings all three ports
up. UCSI_GET_PDOS
also fails persistently with -5 and occasionally -95. Same firmware,
same platform. I can
send that as a separate report with full logs if it is of interest.
