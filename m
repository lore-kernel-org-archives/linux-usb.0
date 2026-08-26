Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165CA36B921
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 06:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787725666; cv=pass; b=SEGR0pBTkch+rJdoz4rLzJMazrLW6hHfablKX681lY6R+j89EBCeSOQaZvAUjDE7St8OnH7JXMJUAeuvkw+6aiEdw1/zsJByDpEp7x/WZyhpBd/wdA0udD0pbL1PBTuWVqmFDkohHCSfs8iWC9PkQxsyrF8lM+aZx0ZRQs5qKjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787725666; c=relaxed/simple;
	bh=SRuRWxMQzXeC+rs0OpNQyle4kcKw6RCGP24XO/bNQ5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jSjCKpa6cWvpcuIZ/hm4pBMvB5lMYwdB69b1UN0eyd71PDfkbvsmYFAlKDwZel0cHZAb6ktT3vz36Gf428RejdO8bikoq8QSE2yGiqjzPQ2etMm/W6tess4cZ8PQe2FIScmv4M80+ePiCmt7eAG+wTpJkxm//xY2R7kroCPMkug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cu9oHB9q; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cu9oHB9q"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a1f628b0afso4951251fa.3
        for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 23:27:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787725663; cv=none;
        d=google.com; s=arc-20260327;
        b=H4aOv4/WSL4+30cYpoFwgDFM4qCyKEcdqmTPkLnfLfNh6FgPjpWATmA6/m5pcd0T0V
         U46ExaOq55B3O9bfkT+0nB3dktIPEYJoWsjpI4lIwJ2UitpHP+BI6khVx+A09ZGhYR1E
         VXsO/UkBzweLyMkmEseVive4CBVy1p59MtbqMHTzX5fxtZyx5qW3VEpCcOuPCnhXrTTW
         JpTvwOn0+TWzgXOl5xKgwhxr+8koQ4Kz94UiYOg9+tE6NKUofgJzOxuZfwz4Z7jUGy39
         s3tenWZAxZH+aCCT4U9K8oIrEZcQS2XMYsVIW2OkIin/WTDbfJkSg4cGAOgYywJCGC9C
         9VKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bCQy5KYAnT0Nqu+N8f/uz+vDCHlQ4T9ZBMVo1dyy1DU=;
        fh=RYQYrdonYEKVhrr3XKt6Uw2iwJp5BP5Cbrn/9oQMS1s=;
        b=n0KX3A7qkB+MMbjRcqhngcRIuK1D/HRzbWLpEIIZCupN2rU349WPWECB8f2q5ltriB
         gan+kw8JScuFKPdL8pVkeD1u3DZ4vlGhjRiH6HPcQsQDoOPt8gWYYCi+lhfK3Li/Dl7w
         GjkL/04rqAVum/V4cVvDgq/6SRB405BjWDCzAJS4QJk9sLA0ppwrBw2nOUEEMrWNHuEU
         CBetwJ17R1hX0NXYLjjFVTfSwSI977mHEePMWC6wu7jyiLfIjwBv9+FvhRT0FGKyQrMa
         asiwU1d4I+NomLPGwuKz0tsLfGTr3d1pW1l7uhqbj1ry0I7+y6HF0ax6vm7NO+p31rKx
         crgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787725663; x=1788330463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bCQy5KYAnT0Nqu+N8f/uz+vDCHlQ4T9ZBMVo1dyy1DU=;
        b=cu9oHB9q/726O+EvsplabMDIgCrtrtFmQZoyp2oIvy+/Q1SmEMY7wGlLVowjG4+OqH
         k//wznaW3aOt0n8l2fe/ZOaftAb7+Qsjwo6ZtdwwoOcEH+P/ClQk++nRvR9F8HUQ12QA
         CGAgKDDxvC9lBfw9R+W1fK1+Jb88qPE2k10u1POq3487spkUfgGjnmahSs8ajaNGMxBf
         5ofz6lwE8vxJI34u4P7nZfTKAa/LBTh0icdjGDpBzID475nLWl4JJXK2nZY1MqzjvDJd
         ZPm1iyCoiXw8JhU57xbiofpHMkBA18rI6271hRYyQCXrYXbStodh9q5y2oLiK/QJvK5u
         odCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787725663; x=1788330463;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bCQy5KYAnT0Nqu+N8f/uz+vDCHlQ4T9ZBMVo1dyy1DU=;
        b=MO8bPcwGVQ4mFJFzlrrE7LmrUOrqFxcnCNlhnNmIHH8BMsRsGX41lF2qOdYz6MDHnZ
         WZp3fffhnZSaL9m7pMrNOo5kDDcaHKW7GQGGZAPZBfCy4oYVo7fV0LUZtIAEzfxOdLmU
         xX7Dq19SFYzULufsifIajsJBdnYSwa3lVsNyeutdnRu9xqffAiTZ3Zjg9o1e2OcNz6Q4
         kdlpS9ciH8KdGye0ngDIk14uHcjjOiU5QYC9U437A3IHUOab1gl1SFR8oCm3YxpeqbmG
         ztzMAkPvjog4SOrLj8sipSr5PlqqPl+0N1tar4y/akh9W50zBkg3jra74pycUiDc3Vap
         syPQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+O8hRCm4GGvS3Wd0UYTE3pZVKrnKPvyF47Q3yK8st5gypBTebItIvjm1gKE+ptXzJ2sGiCGo0NV8=@vger.kernel.org
X-Gm-Message-State: AFuF++l+Q49zVYGI4eYZCGnFr+Z8hlaNMcsBkDj2/1tUTXXvZYrYKMnd
	IPUZvVQ91cHEMyLUcY9/4QE3wYP9o5pq7tdxqVVBu1cEZ4eVMRAZF3Bqs/o+pb/AsemxaXY08m1
	y3Xt5SbsuhPCYFcXG7Ms9EMzVrrZm3gvahsTCuqub1g==
X-Gm-Gg: AR+sD11HKriaKGukJyTXW2gyJA23lclIs325DNjzDyh1/9WraoLhmAtfnv4Iis/Vdag
	HKG2RWseVXDZCdxLJaY50q55FNQ1lw5gYARAdYkGqXrD0o5IUwoz5AwdqAIfAlRKw7Le37UsddF
	h73BM/xVTGNXUka9Wxmams9ud3tyGW8uhDYBLcnenPMzor6CVW3rtwMGp1/vVPMdoV/3rB/LoO3
	OpTJNT7GjKUGcshmwu3Uzb4W1hfBXPpSDPh2ZG8kSia6Q7ThoCubYVAww4nYwOHQg+rRN3y/cp1
	wU5P1wroas6sCANMqeSrOi5LY7flPWgariEIYNfbI0wj4Z4LDc+HCxqcdCAKMGnlBBsEOUdqxV2
	P
X-Received: by 2002:a05:651c:41d7:b0:3a1:a8c8:2e21 with SMTP id
 38308e7fff4ca-3a1fd67d0eemr7541131fa.9.1787725662800; Tue, 25 Aug 2026
 23:27:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPyJwA_D9qw0T72f8zwM1yKjP+To=maVANbcdsWM7yRmbBxYvw@mail.gmail.com>
 <CAPyJwA9R=p8_uxyYODb00g_nUq26SRsWHBGgAAJnR0YMTRRo4A@mail.gmail.com>
 <CAPyJwA9P48LDcOr7u_iT1WPFBCHxh9w6cxFvyi5GS3syM6crbQ@mail.gmail.com>
 <07435e6b-ee30-4c85-8c8b-0ce3a4ead1d9@leemhuis.info> <aosGtkE_diwVJJtB@eggarch>
 <20260823174059.46fec036.michal.pecio@gmail.com> <aoser8dLytrwqBC2@eggarch>
 <CAPyJwA8m_Xd2oyV1i9k+-6f7A-j0FiC97yXL=Ci8ZAErs5W4vA@mail.gmail.com>
 <226b2f34-fa25-4ca6-8afb-0b3dc942715c@amd.com> <CAPyJwA9GvqeaBYhN56L1S9YW-rwWgFejrcNcE=54DQC3Eaqxww@mail.gmail.com>
 <f6f2f984-f31b-42c9-b120-6c179803dd2b@amd.com>
In-Reply-To: <f6f2f984-f31b-42c9-b120-6c179803dd2b@amd.com>
From: Mathieu Fluhr <mathieu.fluhr@gmail.com>
Date: Wed, 26 Aug 2026 08:27:30 +0200
X-Gm-Features: AcwNN1XQnKUyXlrnQKHlAQ_Lew01uxWBW7szTdABYW8DO1E4QbjhmLgnHDZw2_0
Message-ID: <CAPyJwA-DqScij982KfUQQ3ad2nHF4=SEBjjQhQGr1yCumdMXHA@mail.gmail.com>
Subject: Re: [REGRESSION] 6.12.36+: usb: hub: post-resume delayed work
 triggers > uncorrected MCE / data fabric sync flood on Threadripper 7970X >
 (bisected to aec11e5f9c45)
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Lovekesh Solanki <lovekeshsolanki00@gmail.com>, Michal Pecio <michal.pecio@gmail.com>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, Mathias Nyman <mathias.nyman@linux.intel.com>, 
	linux-usb@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Forest <forestix@gaga.casa>, Slavik Dev <developer.slavik@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> The workaround you can do for now is to disable runtime PM on the XHCI
> controller to avoid triggering it.  But it's a platform issue.

So, long story short, the kernel source code is correct, and the issue come=
s
from the BIOS/AGESA, correct?

> For a proper fix you need to reach out to ASUS to get an AGESA upgrade.
> You can ask them to reach out to AMD if they need assistance/guidance on
> the versions that contain the fix for this.  You can share this thread
> with them for reference.

I will. But this leaves me with a few questions here:
1. Do you already have a fixed AGESA on AMD side, that ASUS could use?
2. Does this issue also affect other threadripper generations, like the 997=
0x?
3. I guess not only ASUS is concerned but Also ASRock and Gigabyte which
also produces TRX50 mainboards, correct?

On Wed, Aug 26, 2026 at 5:14=E2=80=AFAM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
>
>
> On 8/25/26 03:57, Mathieu Fluhr wrote:
> >> The behavior that is described here sounds like a platform firmware bu=
g
> >> Are you on the latest BIOS available from your OEM?
> >
> > Ywa, And I even rolled back 2 BIOS before, All 3 are showing the issue.=
..
> > ...even the exact same one (with the exact same CMOS settings) that I
> > used in 2024 without any single issue.
> >
> >> Can you please confirm:
> >> Your CPU model number/codename
> > AMD Ryzen Threadripper 7870X 32.Cores
> >
> > mathieu@ubuntu:~$ cat /proc/cpuinfo
> > processor : 0
> > vendor_id : AuthenticAMD
> > cpu family : 25
> > model : 24
> > model name : AMD Ryzen Threadripper 7970X 32-Cores
> > stepping : 1
> > microcode : 0xa10810c
> > cpu MHz : 2188.582
> > cache size : 1024 KB
> > physical id : 0
> > siblings : 64
> > core id : 0
> > cpu cores : 32
> > apicid : 0
> > initial apicid : 0
> > fpu : yes
> > fpu_exception : yes
> > cpuid level : 16
> > wp : yes
> > flags : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
> > pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt
> > pdpe1gb rdtscp lm constant_tsc rep_good amd_lbr_v2 nopl xtopology
> > nonstop_tsc cpuid extd_apicid aperfmperf rapl pni pclmulqdq monitor
> > ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt aes xsave avx
> > f16c rdrand lahf_lm cmp_legacy svm extapic cr8_legacy abm sse4a
> > misalignsse 3dnowprefetch osvw ibs skinit wdt tce topoext perfctr_core
> > perfctr_nb bpext perfctr_llc mwaitx cpuid_fault cpb cat_l3 cdp_l3
> > hw_pstate ssbd mba perfmon_v2 ibrs ibpb stibp ibrs_enhanced vmmcall
> > fsgsbase bmi1 avx2 smep bmi2 erms invpcid cqm rdt_a avx512f avx512dq
> > rdseed adx smap avx512ifma clflushopt clwb avx512cd sha_ni avx512bw
> > avx512vl xsaveopt xsavec xgetbv1 xsaves cqm_llc cqm_occup_llc
> > cqm_mbm_total cqm_mbm_local user_shstk avx512_bf16 clzero irperf
> > xsaveerptr rdpru wbnoinvd amd_ppin cppc arat npt lbrv svm_lock
> > nrip_save tsc_scale vmcb_clean flushbyasid decodeassists pausefilter
> > pfthreshold avic vgif x2avic v_spec_ctrl vnmi avx512vbmi umip pku
> > ospke avx512_vbmi2 gfni vaes vpclmulqdq avx512_vnni avx512_bitalg
> > avx512_vpopcntdq la57 rdpid overflow_recov succor smca fsrm flush_l1d
> > debug_swap
> > bugs : sysret_ss_attrs spectre_v1 spectre_v2 spec_store_bypass srso
> > spectre_v2_user tsa vmscape
> > bogomips : 7988.27
> > TLB size : 3584 4K pages
> > clflush size : 64
> > cache_alignment : 64
> > address sizes : 52 bits physical, 57 bits virtual
> > power management: ts ttp tm hwpstate cpb eff_freq_ro [13] [14]
> > [..]
> >
> > 2. Your OEM (from /sys/class/dmi/id)
> > I am using an ASUS Pro WS TRX50-SAGE WIFI
> >
> > root@ubuntu:/home/mathieu# cat /sys/class/dmi/id/board*
> > Default string
> > Pro WS TRX50-SAGE WIFI
> > 231230340100705
> > ASUSTeK COMPUTER INC.
> > Rev 1.xx
> >
> > 3. OEM BIOS version (from /sys/class/dmi/id)
> > root@ubuntu:/home/mathieu# cat /sys/class/dmi/id/bios*
> > 02/03/2026
> > 13.17
> > American Megatrends Inc.
> > 1317
> >
> > 4. AGESA version (see commit bc91133e260c8113c1119073c03b93c12aa41738 i=
f
> > the OEM didn't tear it out.  Otherwise look in BIOS menus)?
> >
> > The BOIS shoes this information (I also put the ones from previous
> > BIOS I tested):
> > BIOS 1317: ComboSP6PI 1.0.0.1e
> > BIOS 1203: ComboSP6PI 1.0.0.1a Patch A
> > BIOS 0803: StormPeakPI_1.1.0.0g
> >
> This isn't a BIOS regression, it's been around since the beginning on
> this threadripper model but it was harder to trigger.
> The Linux kernel changes in the bisect exposed a platform issue.
>
> The workaround you can do for now is to disable runtime PM on the XHCI
> controller to avoid triggering it.  But it's a platform issue.
>
> For a proper fix you need to reach out to ASUS to get an AGESA upgrade.
> You can ask them to reach out to AMD if they need assistance/guidance on
> the versions that contain the fix for this.  You can share this thread
> with them for reference.
