Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.194
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794502174;
	b=FbNpk/9p0qW4qlbqoQ+cP39gIh+AGcRZRDk7iNChKIiAatQQRzEvZAuSAsVL1vVv7Wt9
	 NSDMoDg2O74neXzEXdPOI0b2104IaaMqy5cX9ofMZRWgyjbjVtatorDKteFQ8VG91Fq3W
	 irhWjeKsEq3PbCPcL/4HxxJBYg7SdGDeyl+OqOxY7FmbpBfkL8AWcqWo9P+FTCH4yM4FO
	 +x1iO85GS9NN+9apvwH3YMz9MHqyuVoLGtOGI+3XajZL4fWq/ugJxP3qDf0p+3G6oCwzG
	 L1RwtMoQOXZ2oWJzCHAyIefXVwa94JuiZnr6tn7sCmn/KFzJ/WKXjyf7XXdP725gEfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=9B0x6SlwXhZHGSGz1g1xDtDQcPbSiewX37Fbcqs1MEo=;
	b=w4El2tEpGPssHzernUJt0P+68TDv107hU9XtVXydujU47Cc3pXr2gJC09uQ/6ePh4cl6
	 PCla3JLIV0mvWfguvH5SO6DtYBx+okNQU8Tfr6OxONn1kKwH6UJ0TTGcpHBGmLwAwIlPM
	 iZabAnvlduWNpwTPiqpM6D2rlvzjaasxvaZW0SYPlxGn2NdjY2w9rJcx286xKVmyRve6v
	 v1deXsNGuiHUZx9OpxLS/Zh6fKO3u+sWt/gGBGNe1CYZVoAHCoEFJyhXzDCOlipL/drHc
	 s5WQnzuYRIgO/YcIilfGT6YFt6kHN0ioHOV+WxvmSaHVU6cF4WMVd/EJHZNPko+2s5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iWvUjTDj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.194
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96932606A327
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 16:49:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96932606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iWvUjTDj
Received: by mail-lj1-f194.google.com with SMTP id 38308e7fff4ca-3adff684a52so176461fa.1
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 08:49:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794502172; cv=none;
        d=google.com; s=arc-20260327;
        b=p8tdSnP80jqUJejd/XRozBZZRm8UhIsnGSKUwB0wZB+NoOnfkvB6DkliWAodQARDht
         8f7FqY1WJqi0eCCk6eyPHB69QLAdoF28va5+0B3zmTJtbUuPqww/p81YNU2IbAw7txlk
         +sHdhtvXjVpMtfvgZ8izrD+uyMKKzMG2wefZtEau+W6aB1IhZQ8pgRvn0zzMIxS3CWbf
         qma7irysieGV6OIGwwo5Re/SqTP6AZBB8fFvYD/9tBbTMuH0pRSCEhgHzMMzaPlawMVC
         v3TzEU0kIPunlH50dUSs0Bn9xsvor6PbJmKoiQH3lX5es3r8BHTGwVw0nQbOm8m72uHv
         jQcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=9B0x6SlwXhZHGSGz1g1xDtDQcPbSiewX37Fbcqs1MEo=;
        fh=lZJXk+KVrYZ+VNxk8CKhFY0bzlIWjaodyd2t9Ubeiuo=;
        b=WJhx99sy0xYew+QYDr7TAFGXzKTOrs3d9eTEUrrfs4k4bk9/KIVAJLicZxXbAKKKhW
         6S6bQZCGBcd7R+aYGnz5vAdqp2XjDPB7sL0hMHO9u/c12GXjQdPzVIkeFAlYVTqjj/Dc
         ber0+W8r6jeEaKgK1SnzWlkpiYTKNxU4Xx5vTdamyhEjPtiPYAN7O3w+6H90MAfEKKSy
         +8U6+a3WrKfYa/Aiy+dyhBZ5ntUKfKhqlGH6/hfEDWPkQKcV6UB4f8hAIP2e4ui3cP+/
         kv9mHGJCPsW8Hv8oUOX75ES5jNkdkXFt9ure+ZjWos60DfAP/uw6sepGP51Buu4KiUfm
         tolA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794502172; x=1795106972; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9B0x6SlwXhZHGSGz1g1xDtDQcPbSiewX37Fbcqs1MEo=;
        b=iWvUjTDjYGLtoKclmoeCM4H8lhbvS8Z8CI/IKgu8Th20SScSOx/VoERtjkdVuJIy6E
         igYR6S+Mmg4SaQJX+36/uPLX0F6m4fyzGPp4aaIjPB6rWv0nf6yRGiEqlzB6gk21e/8+
         F9ZaVXRA+x1kB3exBBI+d/VBjQ9AdfI3RNeCmA6Mt+MlxGCKICpmSYEm61BizLx0VJET
         o9jejpJwgIY666PUJTkkIhRRa6v0y8M8hePPUpN5OxmfM6rfKS1FwbgG0OPvrloKLONP
         Nd1eYtjmwL7AkIwhZejecJQ7J/w02biF+kQvg7ZMXszinn4pT25jlCFLBBNhP5QcCEum
         WOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794502172; x=1795106972;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9B0x6SlwXhZHGSGz1g1xDtDQcPbSiewX37Fbcqs1MEo=;
        b=f+EIGNloFadzY7PZEAyOpXaIp++YY31jgJoPbL1kRsvK9eXlp+kFsC88Kj3tSI6g0X
         KFf8KRxH1vmOB+XjA8LxfbaCwL6dp6ahye6Ce7b4YnH4j/ML08Wcbb2/K4hZwRw35WCG
         a7lIWE3sGTk3f78wp54wVtQE0JH5pW5VmUuEiuLzE8XFq3kDSiDXiE89Lq63SAs1D7LK
         0OKQEiasVwO2iUjlOJQhyD47sch1Kv9eTSYm0FWHah4BwORMrn1h+rSZPgWhutalJUpD
         SF5A1oP0HgvSmbkVHU7OBfkTYCO/aqfjidNQt13ecvQoOcHL4htvJOVkI4b/g2Q1F5NG
         wDCA==
X-Forwarded-Encrypted: i=1; AL+hErGOGLbAHZGbxLI4ZtPvqdW3azhhZdepbuKNYa8uWp2uH+8J8kQwCQYMD6XuopgSFM/i8vXTvwOnyjU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Uiy20F0F561J3EWGiWEdvZGjRBFafhvIa4pOt80j0zllUhtDf
	wsrUXpmWffJZn74gtvsCb8Zngkt8LSXjWFjjyPKqQh53lLYGjJ+fDiGygB4nDlBbI7uEb2LcWUo
	I6yaWJp0jRo5I/DVKjtLT+QysrfNVMJScQdPb0TlgGoEN
X-Gm-Gg: AYBFou09FpfFK5GC7xdqeieh/I0oWhODgHV46lRHOuVfpoNswyQbndJ/JCV0YkkGfcs
	iADHcjb7twICeCJEbifo7cNt9k4sVmbJZZsnednYKoJpaZVDMUdrKHvQ6xEW6CeXRdpp2k2YxFb
	dVnnonWtbfg74e+97zyrm0f6Xu3WL8Vp5haDUeTCuf91rN76J2V6Hh1DOH382gbym/KPoPCIYAY
	/EDWH5qdN9JcQeNJrS1RTZ5ZWJZ/szlbWx3MWoEndfwgVpjYpvJ6FC7TO7dRKgaAayCkxk4Z+Nh
	AvkxdgmMl0PXlwJalPnNifOtGtswPEW2K15KP0xDzPiu+s8UfIumGESElNQj2vfrBL6csyg0IUs
	LGyH7p+plsDBf7yFWlSOiXkSS3z8cRBTG+1/OU7oSstSAMZzIpdMjX3dTNwrt4JoNm8d3ig9UOn
	DHYku7HrRYZ/FApg==
X-Received: by 2002:a05:651c:1607:b0:3a9:8775:5f11 with SMTP id
 38308e7fff4ca-3ae1bfb801amr8051251fa.4.1794502171606; Thu, 12 Nov 2026
 08:49:31 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: =?UTF-8?B?6ZOu?= <fengaojigui88@gmail.com>
Date: Fri, 13 Nov 2026 00:49:19 +0800
X-Gm-Features: AclHuK_rQEbphEVssARDDlFRz9NaI-h2rX0d7OAHgvFohhN8Nh_vkLD1OcPgrcA
Message-ID: <CAO-4RZ1Xu6vdLg6y74YfyT=On+Lom9L+XprpvORdXXOdOsAALA@mail.gmail.com>
Subject: [BUG] ath9k_htc: KASAN slab-use-after-free in WMI event tasklet (v7.4-rc2)
To: toke@toke.dk
Cc: linux-wireless@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Toke,

We found a KASAN slab-use-after-free in the ath9k_htc WMI event tasklet
on v7.4-rc2 with syzkaller:

  BUG: KASAN: slab-use-after-free in tasklet_action_common+0x2ec/0x3b0
kernel/softirq.c:988

  Allocated by task 1259:
   ath9k_init_wmi+0x49/0x320 drivers/net/wireless/ath/ath9k/wmi.c:95
   ath9k_htc_probe_device+0x203/0x2650
drivers/net/wireless/ath/ath9k/htc_drv_init.c:956
  Freed by task 1259:
   ath9k_htc_probe_device+0x292/0x2650
drivers/net/wireless/ath/ath9k/htc_drv_init.c:978

The freed object is the WMI control structure allocated by
ath9k_init_wmi() (drivers/net/wireless/ath/ath9k/wmi.c:95) during
ath9k_htc_probe_device(). The WMI event tasklet (wmi_event_tasklet,
registered by ath9k_init_wmi()) was scheduled by an incoming USB message
during probe. Subsequently, a later init step failed and the error path
(err_init -> ath9k_destroy_wmi(), htc_drv_init.c:978) freed the WMI
structure. The pending or rescheduled WMI event tasklet accessed
the freed structure, triggering the use-after-free.

Kernel/config: 7.4.0-rc2-kernsight-kasan #1, built from v7.4-rc2 with
CONFIG_KASAN=y, booted with oops=panic and panic_on_warn=1.

The crash depends on device state built up by preceding operations. The
reproducer consists of 50 priming programs and one triggering program
(51 programs in total):

  syz-execprog -procs=8 -threaded -repeat=0 -executor ./syz-executor
repro.kernsight.prog

The programs are replayed repeatedly with 8 parallel workers (-repeat=0);
the execution order is not guaranteed to be strictly serial.

In our fuzzing pipeline this reproducer was verified on a fresh VM
(reproducer pipeline outcome: confirmed=true, status=verified).

A full write-up, the reproducer and the crash artifacts are available at:

  https://github.com/Zheng-zheng-codes/ath9k-firmware-tasklet-use-after-free

Repository contents:
  - README.md                      full bug report: phenomenon, KASAN
                                   Alloc/Freed stacks, mechanism,
reproduction steps
  - reproducer/repro.kernsight.prog
                                   pipeline-verified reproducer (50 priming
                                   programs + one triggering program)
  - reproducer/repro.prog          triggering program set from the pipeline
  - reproducer/repro.priming.prog  state-priming program set (pipeline recipe)
  - kernel.config                  kernel configuration used
  - environment.txt                kernel image info (sha256), QEMU command
                                   line, syzkaller commit, reproducer command
  - logs/log-*.txt, logs/report-*.txt
                                   original syzkaller execution logs and crash
                                   reports from the fuzzing pipeline
  - logs/machineInfo-*.txt, logs/title-stat.json
                                   guest environment info and title statistics
  - logs/external-verification/    external verification serial console
                                   (contains the KASAN report)

Happy to provide the full KASAN report, kernel image, additional crash
instances or raw artifacts if useful.

Best regards,
Zheng Zheng
