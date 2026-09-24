Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D6045D5DE
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 16:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790267336; cv=pass; b=tDum32LxTyk+Ye8DC3Td9p2slPtvfvrmRQjhu3JGGLOw8kiiee1qSf1NUxkyzrKPkR+a+sDgmZXCYuWYyfs0Oc1bj4wwuy5ETggnHUin8B47oX2u+2a1VmwA+zxjNa0X4ghwoHY5nb3ccvGHtJWswsO1OiZDUaq3Jr5LitSBSWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790267336; c=relaxed/simple;
	bh=xVlqlfcQ5EoFREh/zSmkPMwya3RFUsnhEYT9h97TmUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aW0XuCPsarjtINfnajutjlav0bzcGkrxD9CK/eDGSTbOcg09cdimdNvBWaMNlHTYqBse2hpkFjjr4Rt+5jR6GjaQkru9suF33hQoh6WmoLvk6UJwPGUF656HT1ZT1/LsjGQXmPvDarH6tR5/KqR1lTHfYfQCLv5nJZxMkuiqdeI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UmvbSh4I; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UmvbSh4I"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a8070899e8so4319a12.2
        for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 09:28:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790267333; cv=none;
        d=google.com; s=arc-20260327;
        b=MKxiUlN+xA6+Qiln5U50majBcL/12CEzz2UOPcEJ+LlGI4s+e9iOgP3rAvlF6HF+v1
         NQeDsV8lSAnY9P7m4HARfQ5r5joAl0xr1yOjRlurxhwCa67Y24LP/UdqKM/telyXM0lA
         506DBCMpsCzbthe9fMnJqEK7cH5+XnHRAY9tvSUSAOFJlhaBHZCXUet0eix0XXvz6F5V
         XSDnjGbR8MRt0UmHIelYgIKIMr0Vy+adeecalF5Rwq93rXa9jl/1nxw5N6iPTQ0gDwAJ
         n+AiVwmpxnzQnAffBZJoM1cV31IyRoclvMv5R7PxwhjCyggCXa2DLMxHoKYwZv9P2lHN
         QkPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eNPvknmYCj9K3GyRATizI1NhVngyZA0pw2T7jPj1ufY=;
        fh=O0KVaQDyN9mtmiltoxtvUnySzqV3HU7amZy/1p2W1sY=;
        b=aWe1tNr9yHU/+BhBVcviBIFYNZqSc7ZULMw/Q+qtX/ShogGa5radqnFgt9XbHLHe8k
         zREJPzLIwU6ZLgfpTRdCjmMNgFR66Zzucmsl4jgK/TFX5RefB33vk2wf+Td22+sMwt+A
         3DfS8aUvWNFJMbuOw7uMuMG1YFr4uTxljfG5MauatUN6lawbK8V9eNujQcac5JscM6dq
         UH+Yrt0rQYaQNPvW1bqzNYTLWGsRCrw5195NGE64S0neEmtdXe3JMxDo5eUg0Rfq/SPb
         3RWe+Mk7p5KSrIueaFBafDauLKiobVQ2qNzLtrvwva6Xoo+VCZ32SSpf9pYm4X9n1UGC
         afCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790267333; x=1790872133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eNPvknmYCj9K3GyRATizI1NhVngyZA0pw2T7jPj1ufY=;
        b=UmvbSh4IUHkQrVn5U/2ZAr6OpgbQE9NUXh35pUM74aQEqTI5tl0J1gnzwGc4aU7HNF
         c90o2KwTIpHQDUDS/1wZqM3Sfyi00LrbPeQzDMxYFJ69aR4ieD2jFNq0OV+lvXQSCsYT
         KEwRX/QI7gpPu3Rg0yER+aegrITashy4gubfOERSDx5WXchmZePHMkTcI7dTkPNJOYXv
         FQ7+XfYnOT30R6Pa7WCA9DNwEs14oryDMN+uamylsE/BjJmOdpoVhwUDpF2xWcc6v6sI
         F6LaT4N7FK+PeG9IpNhPNevEFr6XQRWnXGwVD4z36mJIFTRe0zcyvz82O2uAa1Qus/to
         g70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790267333; x=1790872133;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eNPvknmYCj9K3GyRATizI1NhVngyZA0pw2T7jPj1ufY=;
        b=fSIwGsatU3OYBJuP1481ZVLlS1Xjl8Cx/BJrbnRd/DEsxxDf2NZOz0ihsDuRlydTVb
         kREOaWGmCxKqzlZo7GQTvLJi8duP175neSOCUtnkeuZ6SPLE1q0pPMlCfWIl8OjFz25/
         +F33XujY2YORxsewrccvc0eE7Z3CWv+SjlJzwq9GByKsuNc13bLobe7W3mh4OISVpEPk
         H73WS4xgu+60ufWmBhadjOaUAkAsXL0ucETsz7pf8TI8IQ5QMtsyO2LToq7noUNl9lG2
         s45jCNzScpRmaJTdWO56siO0PC/t4BiSZYFz61XxGgHZPgIoEkDrXbNcybDMR1tJ9mkx
         abtQ==
X-Gm-Message-State: AFuF++l6OFzm2tXUikCJI0XufiuKmoGMpGSU41EaL1dmT4DdYg67n6uG
	kQAlpESD9Pb8WzZaT2kPaApi/+O9X/E7RQAsD3eWfNM/Gu119Cx/+gMxpxybCdgk9XjzbcN9bFT
	QM4SgV768wQNd92JmGXKmD6n3Uhm7B5Y=
X-Gm-Gg: AYBFou3P4jSmXcmErYbP+UNRMLlLkWWOTAji0IaCzp/a5dT6MbqmrdH+slf/GLJtZbF
	njX/VOYD261RhZWFvwGvLG9e5KPWAp0zseyXnu2YMFdsvZmwyhWee23PNqmqIyrxHu50wZ8TVpt
	CsKgMG5ZmIvX5Ga5iQ87lpCkPWnXa2RGWOvjlOfXVeCc8THvcUsqvAoJyz6KykBa145FF8UOZql
	dDRTR4L+8L2eFO8Sk+GJ7pIZbmbetWPxphI/fx8OZf68IIP3zoXjw00kZhMKM4YU6IIxsL/YVjQ
	8Z1dGn0rxKhfvezwv5oqw47LEFTDlwoT9ItTGVGuRD4MElNLOo+Uh0mjNmX6+hySpFxZEU5y4oQ
	G/+33yLN8rww=
X-Received: by 2002:a05:6402:13ca:b0:6aa:490e:5518 with SMTP id
 4fb4d7f45d1cf-6aae1fcf708mr309790a12.2.1790267332603; Thu, 24 Sep 2026
 09:28:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABL4uFnCWgWdPL5s85O49sDyNADf4Lk684nx60g9wox_qOOOww@mail.gmail.com>
In-Reply-To: <CABL4uFnCWgWdPL5s85O49sDyNADf4Lk684nx60g9wox_qOOOww@mail.gmail.com>
From: =?UTF-8?Q?Pawe=C5=82_Frelek?= <pawel.frelek@gmail.com>
Date: Thu, 24 Sep 2026 18:28:34 +0200
X-Gm-Features: AclHuK-M_b6QQiYBhGIpWllsjbk3SxwYjhTNUhdDjAdaUJ8vQ1Z2cJmcSImQHVw
Message-ID: <CABL4uF=f6Y06KmZ+ux2ZrboiLxivFZMyB_dqc4rTiEtiLd3GLw@mail.gmail.com>
Subject: Re: [BUG] thunderbolt: NULL pointer dereference in tb_dp_dprx_work
 after device disconnect (7.2.6)
To: westeri@kernel.org
Cc: linux-usb@vger.kernel.org, andreas.noever@gmail.com, YehezkelShB@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

FWIW, this is addressed by Sven Peter's series "thunderbolt: Fix DP
tunnel teardown while an async DPRX read is running", patches 1-6 of
which are already in thunderbolt.git/fixes. I tested v3 on top of
7.2.6 on this machine (dock unplug/replug, reboots with the dock
connected): no crashes or warnings.

Thanks,
Pawe=C5=82

wt., 22 wrz 2026 o 16:48 Pawe=C5=82 Frelek <pawel.frelek@gmail.com> napisa=
=C5=82(a):
>
> Hi,
>
> I hit a NULL pointer dereference in tb_dp_dprx_work during reboot,
> right after the dock was disconnected from the Thunderbolt bus.
>
> Hardware:
> - Lenovo ThinkPad X13 Gen 3 AMD (21CNS15T00), BIOS R22ET81W (1.51)
> - Lenovo ThinkPad Thunderbolt 4 Dock (40B0), external monitor over DP
>
> Kernel: 7.2.6-hardened1 (Arch linux-hardened), not tainted
> Cmdline includes: thunderbolt.dprx_timeout=3D-1
>
> What happened:
> The external DP monitor behind the dock did not come up at boot. I
> unplugged and replugged the monitor's DP cable at the dock, without
> success, then rebooted (the dock itself stayed connected). During
> shutdown the dock was reported as disconnected and ~50 ms later the
> pending DPRX work crashed:
>
> [  140.825070] thunderbolt 0-2: device disconnected
> [  140.875648] BUG: kernel NULL pointer dereference, address: 00000000000=
0032b
> [  140.877281] CPU: 8 UID: 0 PID: 125 Comm: kworker/u48:4 Not tainted
> 7.2.6-hardened1-1-hardened #1 PREEMPT(full)
> [  140.877513] Hardware name: LENOVO 21CNS15T00/21CNS15T00, BIOS
> R22ET81W (1.51 ) 04/10/2026
> [  140.877748] Workqueue: thunderbolt0 tb_dp_dprx_work [thunderbolt]
> [  140.878003] RIP: 0010:tb_dp_dprx_work+0x82/0x160 [thunderbolt]
> [  140.880927] Call Trace:
> [  140.881164]  <TASK>
> [  140.881652]  process_one_work+0x198/0x370
> [  140.881896]  worker_thread+0x1a6/0x310
> [  140.882380]  kthread+0xf3/0x130
> [  140.882863]  ret_from_fork+0x2dc/0x3a0
> [  140.883818]  ret_from_fork_asm+0x1a/0x30
> [  140.884065]  </TASK>
> [  141.399331] Code: 24 20 48 8b 87 58 ff ff ff 48 8d b8 18 03 00 00
> 49 89 c4 4c 8d b8 18 03 00 00 e8 39 ff db d3 48 8b 8b 60 ff ff ff 48
> 8b 41 20 <0f> b6 90 2b 03 00 00 c0 ea 05 75 5d 66 81 b8 18 03 00 00 86
> 80 74
> [  141.399974] RAX: 0000000000000000 RBX: ffff88ae1389c4b0 RCX: ffff88b04=
0d53578
> [  141.400298] RDX: ffff88b0916f0000 RSI: ffff88ae1389c4b8 RDI: ffff88ae0=
11a6318
> [  141.402844] Kernel panic - not syncing: Fatal exception
>
> It looks like the DPRX work is not cancelled when the device behind the
> tunnel goes away. With dprx_timeout=3D-1 the work never expires, which
> makes the window large, but I assume the race exists with the default
> timeout too.
>
> I set dprx_timeout=3D-1 because the external monitors sometimes did not
> come up at boot (DP tunnel torn down as "not active").
>
> Full pstore dmesg available on request.
>
> Thanks,
> Pawe=C5=82
>
> --
> Pawe=C5=82 Frelek   (=EF=BB=BF =CD=A1=C2=B0 =CD=9C=CA=96 =CD=A1=C2=B0)
> pawel.frelek@gmail.com



--=20
Pawe=C5=82 Frelek   (=EF=BB=BF =CD=A1=C2=B0 =CD=9C=CA=96 =CD=A1=C2=B0)
pawel.frelek@gmail.com
