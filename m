Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A0F387363
	for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 14:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790088506; cv=pass; b=n44/NlgTyPhZhCHpZmCxoJ6+isvOi9VL1OmF3TEasd+bhjKxlvXYPtucxQn0RMFBIWVF9j5icBDTsW0vEyGlhojdG/IrJvYtgjT6FAEsS45wfrNQ6LgVk6V3+kNIJbIsqcSN93vzBSrnA/FO4J0qyb+OkNe7pYyEbbRXNlz3cSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790088506; c=relaxed/simple;
	bh=/BbID44ZW/fwXNARzdUW2JPI7ko5n2mKUMxn2jhHluc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=fG/HWs1OvRQ9QCWR3BaRUZFdDoqq4hyP8E6iC/cTrqcjDZyp4n+c5cTf0Y9TbTegQCVsGQqFPKoRrI1enCAzKScniVkgIp6ZrOz11bCTC/TrQEhOVRgr1F3cvyX5OCdBIc/LtXM/7WKd+kMm+SD8FOuuPAnyH53r6tssSvkvWws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fuWBdSaP; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fuWBdSaP"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a5d8fe8912so768950a12.2
        for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 07:48:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790088503; cv=none;
        d=google.com; s=arc-20260327;
        b=gWo/gCfJXz+bnZSHKJUW6epEekEE2ztQXkd4prps1wQcI02YRu9EcNExbHo9sJyIO5
         lmc1cnxm3jv59B02e5g239v+bEGR5Zbi6ScoqdZqU6F3SqupylcW8CgUutv2FWDKKdIZ
         sveKaCTJBJCWz31hvNdPjj8mvBRDh/7gR7jQQegcwiB5d8nHiCqtJ6EYp2KNaUDWh5Kj
         +81QaTEIM2rPitqLHEgeDuP6YhXMNkgo0U6OqCAusc+hrcQNB/FVew/Tk3Uj1fy/qQec
         R/vQzcQdU26SWTsbqwKTfr2iJotvyo3RSdFFfsKSjPgBwPcbSsqR24N9cTm9WXZn4Cve
         EGWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=lL4JNL6Rht/e+e23hewr4WFED9WIzDsXJCcqQEUFftU=;
        fh=+CZ+1GZ3225i1ahl592c0nIKp+kpg6or1LmOx4AlZv8=;
        b=D1w0V/D452B33PLZ95M3inX/UN95X2THc68h3Ldav7at4uhotbRCdNqQ7SW5jpggjJ
         dw6kPc2V8dEtdwuM6oVyXX+P1LroQB25rTCM5OqLUaqTkRhlHpS0YQ1BhpThBwiMrJo1
         eetz8G0vA/h9q3s0zsVeJSswIPJyNj4wbb0vOPdpgmMvvz7IU9ffFecr1LB+k2RFI2QV
         aUTLAaKS7n7EJfBvtRSVKJmUvBwdT5WEdrYdAY2K3EGExxAu47E9Kyx8ZJeJB8u5x4U8
         6v/1VxMCjrao5g0Ge8akobf2o1DyS2CVTo0bg/D7uL5poZJ1XfjOZzVuWBM3rIcO5qY8
         qoxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790088503; x=1790693303; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lL4JNL6Rht/e+e23hewr4WFED9WIzDsXJCcqQEUFftU=;
        b=fuWBdSaPXVAFOPHpKqSqxJQISpz0UIHriI/yp2wVQvhSPmpDa4DXpKfI2xCi1xKh/e
         4e9SAIucnREx0SoNuk7KEpSpBijtMvYPtdg/yT/ffDZOR6hrMIAOOqJZdanSS6xyDuCK
         KlEsshUT2Uy2TNkttKWNV1AESDpgo4D+FY7yycpWEpHsx+8rcZxZULn5skV6xOAmj1qF
         V8Qu+jAalsYbRGx6dWkastF+BbTBIRlWchNnDfbrnDRaCZbr1aIOJ2DWxLrLvv8ukf4T
         eaM6TGcMCg5Ft+3OjZuHsUaYgoNYzidtDwGVhjssyrEZYSBTfGAP2sDTkWgwc3H1wshi
         R6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790088503; x=1790693303;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lL4JNL6Rht/e+e23hewr4WFED9WIzDsXJCcqQEUFftU=;
        b=N2KggW+1X85wok0MxC/IHUuLwAVrzl9gu0zMd7iFoDXKT8X0Qsdbl4Gf+8Aj32YWxD
         UZYFpFV6+ruCFhDvZF+2QG3PUYCun25ukXIto7UUpVOc1rgWkvnnZgvF2Tiu9thq4Skm
         QfN6m9LAk2XGkd1wyfebXZCStn2fVGVRAgviDiXJJtmT0CfAwpkvQJ4jZETS62Yh1Bm3
         Sjjny4QCz0sehk1g0K1ggmzT29fFIbFGQJlQeie6NzICvH9wTIDf0mx63XCBzOev92Z6
         lsyY4vf2EhKTgt2ZN2Bn/yAQZvD5PU2pmsiSGQ2+GzkmGzO47EHC4yq+De8sWu96dPai
         UOnQ==
X-Gm-Message-State: AFuF++kBjkNAPRibrf0+xpruEf5XNPh6A2i2s84bV1Im+71ZVPk2g1ep
	qKPr9IYPsj3npAC6NL/Kphr7CG1rdyzto6DQS4c5D5ttx2AQM9S7d2lnihc7KdfQINf/aEmzWmA
	ctNLbjnML8gdnJ7GO3yW6C7NwNtNmX9Cpb2h5oMY=
X-Gm-Gg: AYBFou2h0+aYDFmJzYPYu7D2XysY2A43ErE3P4wuMzluCFxKrroieUPVHTzuHmO+U6d
	bN7wdMisFM9foOd5gPT9dbeXXJ+SDBS44Bu0BQIgOA+6tsUmYxDeiZ4hB0jWuZ64TzuoZIKRTPS
	TUlHsQrIg9IRKc3pVDXSXm8kCREPpwoLSwmU4LpuUeyKowIpwy/hycl12g6C1Xz1SCoo0gkJygu
	/vFYgM4jAEfW/9OdXhZ9CgZqd1+ln8dZHynRjwlbC0USw5ZvQ2l1RfcljbxvnPZRmW9Nyl1T1Y8
	iaJM9EGmu09bTFonW681Mf9y6suNqIpmES5MM4dsZOsPZLARmPn6FcwpKj9RZTdg0S/lXxgyGQ5
	95FrFoJzGvoJJ
X-Received: by 2002:a05:6402:e08:b0:6a9:98d7:258f with SMTP id
 4fb4d7f45d1cf-6aa57989a40mr12197999a12.3.1790088502920; Tue, 22 Sep 2026
 07:48:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?Q?Pawe=C5=82_Frelek?= <pawel.frelek@gmail.com>
Date: Tue, 22 Sep 2026 16:48:04 +0200
X-Gm-Features: AcwNN1WiuIXj3M_pQsu_lvG9vy4FW1LUU_EB11Zlr08-26LYJ5iHHDCL5aGU9cM
Message-ID: <CABL4uFnCWgWdPL5s85O49sDyNADf4Lk684nx60g9wox_qOOOww@mail.gmail.com>
Subject: [BUG] thunderbolt: NULL pointer dereference in tb_dp_dprx_work after
 device disconnect (7.2.6)
To: andreas.noever@gmail.com
Cc: linux-usb@vger.kernel.org, YehezkelShB@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I hit a NULL pointer dereference in tb_dp_dprx_work during reboot,
right after the dock was disconnected from the Thunderbolt bus.

Hardware:
- Lenovo ThinkPad X13 Gen 3 AMD (21CNS15T00), BIOS R22ET81W (1.51)
- Lenovo ThinkPad Thunderbolt 4 Dock (40B0), external monitor over DP

Kernel: 7.2.6-hardened1 (Arch linux-hardened), not tainted
Cmdline includes: thunderbolt.dprx_timeout=3D-1

What happened:
The external DP monitor behind the dock did not come up at boot. I
unplugged and replugged the monitor's DP cable at the dock, without
success, then rebooted (the dock itself stayed connected). During
shutdown the dock was reported as disconnected and ~50 ms later the
pending DPRX work crashed:

[  140.825070] thunderbolt 0-2: device disconnected
[  140.875648] BUG: kernel NULL pointer dereference, address: 0000000000000=
32b
[  140.877281] CPU: 8 UID: 0 PID: 125 Comm: kworker/u48:4 Not tainted
7.2.6-hardened1-1-hardened #1 PREEMPT(full)
[  140.877513] Hardware name: LENOVO 21CNS15T00/21CNS15T00, BIOS
R22ET81W (1.51 ) 04/10/2026
[  140.877748] Workqueue: thunderbolt0 tb_dp_dprx_work [thunderbolt]
[  140.878003] RIP: 0010:tb_dp_dprx_work+0x82/0x160 [thunderbolt]
[  140.880927] Call Trace:
[  140.881164]  <TASK>
[  140.881652]  process_one_work+0x198/0x370
[  140.881896]  worker_thread+0x1a6/0x310
[  140.882380]  kthread+0xf3/0x130
[  140.882863]  ret_from_fork+0x2dc/0x3a0
[  140.883818]  ret_from_fork_asm+0x1a/0x30
[  140.884065]  </TASK>
[  141.399331] Code: 24 20 48 8b 87 58 ff ff ff 48 8d b8 18 03 00 00
49 89 c4 4c 8d b8 18 03 00 00 e8 39 ff db d3 48 8b 8b 60 ff ff ff 48
8b 41 20 <0f> b6 90 2b 03 00 00 c0 ea 05 75 5d 66 81 b8 18 03 00 00 86
80 74
[  141.399974] RAX: 0000000000000000 RBX: ffff88ae1389c4b0 RCX: ffff88b040d=
53578
[  141.400298] RDX: ffff88b0916f0000 RSI: ffff88ae1389c4b8 RDI: ffff88ae011=
a6318
[  141.402844] Kernel panic - not syncing: Fatal exception

It looks like the DPRX work is not cancelled when the device behind the
tunnel goes away. With dprx_timeout=3D-1 the work never expires, which
makes the window large, but I assume the race exists with the default
timeout too.

I set dprx_timeout=3D-1 because the external monitors sometimes did not
come up at boot (DP tunnel torn down as "not active").

Full pstore dmesg available on request.

Thanks,
Pawe=C5=82

--=20
Pawe=C5=82 Frelek   (=EF=BB=BF =CD=A1=C2=B0 =CD=9C=CA=96 =CD=A1=C2=B0)
pawel.frelek@gmail.com
