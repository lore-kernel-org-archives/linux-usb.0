Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42D8559313
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 17:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171239; cv=pass; b=h+M25ti3S1N2/0J6iySnAu15TfPW1VCvTZ6wdmm/vtzEEnion288rgsdNxyoH/7kSSavgLTBIF38QjHjx04su/6DBswUKZPd3/rHzGYdYKe8UI4bHwN8i8E58eQ1CizvqNgGfwe6AGVRKB1vlYBvkfG3JXJ/V7jjjjGVc6fJSKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171239; c=relaxed/simple;
	bh=3GoYwDX4hl5giJNxj+pC3PajeSlc44qmwVyzj3iXgEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mTMKXHGcLS5DRDEtJw+dQ9Rvyffl5NU1pWiPnSBZvY+kjLMgJQ/PSoa3AsZUNZPij7Y+PFkhHcr+ocGKcl7nEcuZQtSYISnj67Z5Yq12IN6Bi1X/wZaYIm2h47Y72OvDilOBFqhNC6Lq3WJJ2L3dfAoDL1J7hmSgOKO+Vl1VkTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zyo6awps; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zyo6awps"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6af7f47001eso9949a12.3
        for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 10:20:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792171236; cv=none;
        d=google.com; s=arc-20260327;
        b=Trq3Zfjd1ZpDwzmhY+sjH70eKFIgpUMx/XA+wqhJirpATe27SERqN+9jm4pPCoozI3
         c1AQ8ONfw9aSz7pzGUBFEtueUnpsRa6UJrW2hOxfrf7nM/gYH1MMjXXxn0bAd0OLoBQg
         8NdZhi/JucpjTvFVAKB/0E1a2GCiLTttIHxSMN0wchwu4NgKagK065jdR8+HFFcyn3y3
         r6YCxBr9w5wbsJPuLaV/4krIIjgIf32A1n6JZJb+lzVnmCXnz+PVailE0E7leuuahJ0y
         poHLGtS8EGHffJj7qq0p7XiV9b5wlLPxEt5USf+kjvXy/8pB6YxqT6SkmAGUpPfDd+FN
         l0Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SVrnvHpSFC1B5oYNCWr7BHObygI3bn0AURZw5tz97HM=;
        fh=PTN52RQNCEVrcK0l32yNJZrFkyFbkuYLkxjlniowDVk=;
        b=iBSS/IeGmrdm1f6b30UpEn/CfQAdlfJzc6KCCkYxLuvyqmk0b7B7k20emN0jc+yWFk
         Kf0dRfeqgmlnke6kY11ACuu6Yyl8Kmi5a3zKM+VpmmxMWfyy80oLBSzrgKaFjDvCZ5M3
         b/Dax6YHOc7tc2GruQv0RSYGk0PMM1W82Gm4ciMnTD0KYwpdlyCIDCBbLVqBw0mExkdL
         zfztv6aykJ2mX6UamJ+e7dl8LyXwa7unFzc+ZNpjUNF/oEJ86tM5Cjo2kJnofJt6hCOc
         BJiJ2p0NHvZQ+HLo17OQKD3vSENl0SQ+WbqjawMIftwOqPFQMyCxJC4A1CV6Y9OAA2Df
         EMxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792171236; x=1792776036; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SVrnvHpSFC1B5oYNCWr7BHObygI3bn0AURZw5tz97HM=;
        b=Zyo6awpsHxBWrM3M6Np5r9WU+pSY/1ZSElbddGmydkX6U6X2YQVZ7Fa5nOV7kjRWLo
         ETRumP7bXbSNHc+oBB2O8CvhO2U+6fu/hucCaRakzILhIsVvSihPmO49brf/Fo1AKULd
         LXOoyf+wmOb/ME01iafEGwznf1o1TlxpPejTeIHQkkN0IG5pUt68RnLaYGVNDxZIhGad
         g54r4Lj/5LYI7tG4glauTQUwrrbGWVsPmI7aW03ZfgBccU3IsOlN/w1rdE1tVibWiWhV
         5Qb0Z8JAZ4Pj6R+JpOi8Qovd3qZ9BA8v1knu+U6fhV5BTeBZ9k6dNlsru/FeCDWg79VK
         ovZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171236; x=1792776036;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SVrnvHpSFC1B5oYNCWr7BHObygI3bn0AURZw5tz97HM=;
        b=w3ei+sZqctxGl5kSsQLKnTE26wOCg55SGJAoDHeP91a5DJOqN0dEs3528Dsj7gqP7g
         bfWk758MVeashY9tXn80rytn783RNlbYXlJ2E1+5lr3lea1edDF4KYRKGs/it66M8POJ
         Lj2p7lud4fQ8e7PPOfwNnQdo3lpIP259Wk+lSUscldy87beUQGKrQ94eXmGQromCCNP3
         FXJCjJfZkZJESKelLalqdbP0rUtbHcplM6pJUAbYw7TNHNu6ZJotKe2ry9sFgGDL3KPa
         vBTs3+ZmGuyVBhQl5lgFJAobvYdC9Sz8vMT5Kt8nuEO07IuRi7cA8xZN8uXW+PIm/+KE
         8X5Q==
X-Forwarded-Encrypted: i=1; AKwUvByA/YXrj05b+wHQzylLk3V/oJzElzG1mL9ljvSu2zSxe3wy/lKYwXFnahKTJO9PCoBGm+eFiiOHKeA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUXNZiGIk9KLFXaSQm2O/xwedhrdAp664rlBaC1DKX4WhiaCj5
	AjKBQEC4HeKmzS1yU3r8xFc3nf35QvxXsiyeABL2eriSycrq+anqDbvFwIQIjKc0IU7Vei/vQ5h
	5L7a1eyFn5853E0nkbP20Z8Wq2962f1w=
X-Gm-Gg: AYBFou18sDZvUVly8I8uAJJ5FbZfR4vum2Bu4WLouydUwTYbgyuKaMdn5KdL5eL+oNR
	Ve8BPzmzk4b6/+XSQ/au+4TroXLNvajy4lHiU81TI+sXZOvPo05xtvACOOeJ2vjfe63pnmPfJcy
	rPfHUKCFIa18l6OcDhuioF4TuYletm40Jx4IBqA6DHy0gb15qMV/qP5UPqPF8hCWOQb6BPlkNgn
	G1rRcsI/pkOOVTO814gAZhzX9IEJZzu6lxhZ2MDSyHLCUH8vMCtCzzsnBQZK/KUypRUPJo9/QxA
	x7e+8tsMCsZXChG9gfT1AAOf/GqwZQWJ6wQDQbTODWhzRrfj7S5VBtv1/srpJ7iskBZGCQ9xZcC
	lKJK2h8qNIJ1jz/cfCB4rkg==
X-Received: by 2002:a05:6402:458e:b0:6b1:b5b8:b695 with SMTP id
 4fb4d7f45d1cf-6b3a80351e9mr204974a12.0.1792171235626; Fri, 16 Oct 2026
 10:20:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABL4uFnCWgWdPL5s85O49sDyNADf4Lk684nx60g9wox_qOOOww@mail.gmail.com>
 <CABL4uF=f6Y06KmZ+ux2ZrboiLxivFZMyB_dqc4rTiEtiLd3GLw@mail.gmail.com>
 <20260925052929.GW106095@black.igk.intel.com> <CABL4uFn1nTrdxomWgAWs_gtsM5r1owt+4KOk1F39rXTLF3UZkg@mail.gmail.com>
 <20261016055802.GV176164@black.igk.intel.com> <CABL4uFncJktAvO9yVpZOjm=uAjLa7291deE9x805i8Kc7tFUDw@mail.gmail.com>
In-Reply-To: <CABL4uFncJktAvO9yVpZOjm=uAjLa7291deE9x805i8Kc7tFUDw@mail.gmail.com>
From: =?UTF-8?Q?Pawe=C5=82_Frelek?= <pawel.frelek@gmail.com>
Date: Fri, 16 Oct 2026 19:20:13 +0200
X-Gm-Features: AclHuK-ALj7zPG8bDJpah9dkce4b2Uduk9OVCZfSTQFDJ1Vx4ilfx-j6w8UQsjU
Message-ID: <CABL4uFntJCToKB9bpJ-5M=GNnZa6_jPkYWhmy0DrPC1nvmAoJQ@mail.gmail.com>
Subject: Re: [BUG] thunderbolt: NULL pointer dereference in tb_dp_dprx_work
 after device disconnect (7.2.6)
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: westeri@kernel.org, linux-usb@vger.kernel.org, andreas.noever@gmail.com, 
	YehezkelShB@gmail.com, Sanath S <Sanath.S@amd.com>, 
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Mario Limonciello <mario.limonciello@amd.com>
Content-Type: multipart/mixed; boundary="000000000000e09eaa065df861b7"

--000000000000e09eaa065df861b7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pt., 16 pa=C5=BA 2026 o 18:55 Pawe=C5=82 Frelek <pawel.frelek@gmail.com> na=
pisa=C5=82(a):
> About dprx_timeout: without it the monitors didn=E2=80=99t come up on 2 o=
f 3
> boots today. Once the DP tunnel was torn down after 12 s of =E2=80=9CDPRX=
 read
> timeout=E2=80=9D. The other time the DPRX capabilities read completed, bu=
t the
> tunnel was torn down as =E2=80=9Cnot active=E2=80=9D ~14 s later. With 60=
000 I haven=E2=80=99t
> seen this today, so I=E2=80=99ve put it back for now.

A correction to the dprx_timeout part: after sending this I had one
more boot, with dprx_timeout=3D60000, where the monitors didn=E2=80=99t com=
e up
either (DPRX read timeouts for ~19 s). Replugging didn=E2=80=99t help,
power-cycling the dock did, and then the DPRX read completed right
away. Before today, with 60000, I hadn=E2=80=99t seen this for weeks.
Thunderbolt log of that boot attached.

--=20
Pawe=C5=82 Frelek   (=EF=BB=BF =CD=A1=C2=B0 =CD=9C=CA=96 =CD=A1=C2=B0)
pawel.frelek@gmail.com

--000000000000e09eaa065df861b7
Content-Type: application/gzip; name="dprx60000-boot-nomon-tb.txt.gz"
Content-Disposition: attachment; filename="dprx60000-boot-nomon-tb.txt.gz"
Content-Transfer-Encoding: base64
Content-ID: <f_mvb8glo50>
X-Attachment-Id: f_mvb8glo50

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
--000000000000e09eaa065df861b7--
