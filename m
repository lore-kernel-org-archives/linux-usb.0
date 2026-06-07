Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5822253EE
	for <linux-usb@vger.kernel.org>; Sun,  7 Jun 2026 02:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780799401; cv=none; b=tymtFfaA9ux3niVHQbPeL/r9QkHCG9hAYyiH1xrP1n3/6gjSS+EOxXkc/MFSgcYFZzg9R8rgzT9tXIjAy726ruXjDmuInurAWQXQ4YjK90yOIZfHXCv9+DdmZvnSaqkQlyWzRPKTLiVcDxswXxr403mbsz05aH6sPR77Yo4ZsDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780799401; c=relaxed/simple;
	bh=Hn7qBnqtxd0GopNPTj5Ryujiz7aamm1JV7XFtSgCK5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Spsa7pp7Jwiao+pi4uOPpg/0V1KngW8H0OhDsexwt8yUYgNq0HKCNZprgb0p1LP/ihnCTWrdtEbGZMPmZPv+J15q7/pnrI+FovmamTUdVSK3o8oB7JZnmJM0ZbWfQ7Ewy2gvdO9E1Pzbv/T5Qbqa+hFpIPo1O1JaqDgjXcHBKbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=VZmmo6r7; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="VZmmo6r7"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5177b9a02bdso50088401cf.1
        for <linux-usb@vger.kernel.org>; Sat, 06 Jun 2026 19:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1780799399; x=1781404199; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=axGacwxn/LNzpwxXijckWFvUkEVstlQPA+RTlfmsdZc=;
        b=VZmmo6r7A5C75KtegZmR1H+OjXVg+guIYSTXE4rtPvEuxYgxIH02Aw2rxpf2Ivunlp
         wMHIViKu+MrZzSdjgO77tKJa09xmhqu/KW4ShwWPThNpWOLNtaCU6UoDDXc2cCXp39UV
         fip5bchEFs9OKRRXdTaJroaBwGTRyKAgvmFMk3bPQqjA1AHiPif+aH8SiQTH1S8pn5Jp
         It/An+vUpJC9cE3W12czi0diO3EPdWJKtqZ68KJoI5txgmF4T8iSWgk5PVBbJWdeT0VR
         IMQ0AjPQuNtvYp4qSCPIZeh41aQ7t10+UvNaIvY43Iz6uGzm6IaLBmBZexL2GAFG8lA/
         Sr7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780799399; x=1781404199;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=axGacwxn/LNzpwxXijckWFvUkEVstlQPA+RTlfmsdZc=;
        b=RtpGWf4jXy3zmQEUnxBe+Z0iZnsJRfxfqNINDKMu7ipKkFCah80d8LvomAL0i//9wN
         PZAV+ts/2Me57bMrVK1P9MjpJMD6EluNunLrN2PTKS6B7xA6dReGvzdVeoFpReD1Knba
         s7A3iuRPcAdxOJ92lXbYsPGKQX68TUBYCOIt1vj4168tywBwfgXG/Xllr4rM6fSsDIcr
         8BSatwHAl1SuWYfpmzMIKvaCpsytBfR1VqWuKSEa41K5yVibtFmy256NwelE4kr3ZplT
         r4LYGr/ubyDcmdmUU0Z6qOad3GSZSpna1O6yu6Zcw2eWX8JS2fudjgSmPjwGcvTH6oh4
         zIgA==
X-Forwarded-Encrypted: i=1; AFNElJ8AyLCoeuByZiLitilCfCY4hMvs4n//m0mfGzZf2rWXXEvdu9+1W9r1ZbdtW9qyI9qm/TqzfL2rC0o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8zoDNyhLWcaaSkOw9oc2jCCbSMdlP5dfl2s+KViPUYknvIQc6
	sEl+0PxSeNVP+XewtEgPYdJvFeM/pTqA3wCzI+N+yDrUjLTvcTrLuMtiQjuidyJddg==
X-Gm-Gg: Acq92OG/WkLE4CGHI5daUMHMJ7cuV4G+/e4kaVT6ZtSbv71KEQMbwLNdRRNvxa4H5hU
	JRswkmsyt2tgCBXfHnXCQzQW6/dQzcfVBXYenjphDQXRBz7nui6yNSfvxGzN9englMJvWvhl+3f
	bD8OvdVklkMILYIR+KOuxU18RFy8JnTZf8hYPTVDBobPQWi7NAk9yViBfEBu7+hFO5xwaU4uH2Q
	yBY4XO2UfVBVg2Z5g2vlkQWVp6qInMjYkWLAIqXzH5zAl3r4BCggtSdc8E7U2UdUTNwP+SJKmHu
	SLZ4ohOU9CZqNWlyhtsT0pi24Jgj2lHdVJM+elDtD+Z7wBRX/vtDL2NTs8wo0kAcyXTIbejMGAq
	OI1t4enxDs+TIKAW0Fws+IBt2LQ7P5ThhoMDAw08UfKARDkfp+5CMCPrsULal3MsTiZH9sFp0QU
	Qb0gTg6lA0YvcK7aBSCSXj6R+i5eLrJnoWRIjuGQSIJ3ssH4aNs1jNyg==
X-Received: by 2002:a05:622a:1801:b0:516:d943:175c with SMTP id d75a77b69052e-51795cda487mr148753811cf.56.1780799399474;
        Sat, 06 Jun 2026 19:29:59 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517780e8169sm124137421cf.2.2026.06.06.19.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 19:29:58 -0700 (PDT)
Date: Sat, 6 Jun 2026 22:29:56 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Shuangpeng <shuangpeng.kernel@gmail.com>
Cc: keithp@keithp.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] KASAN: slab-use-after-free in dev_driver_string from
 chaoskey_release
Message-ID: <257eb882-44dc-4e25-82f9-9cf9b455936d@rowland.harvard.edu>
References: <20EC9664-054E-438B-B411-2145D347F97B@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20EC9664-054E-438B-B411-2145D347F97B@gmail.com>

On Sat, Jun 06, 2026 at 09:31:30PM -0400, Shuangpeng wrote:
> Hi Kernel Maintainers,
> 
> I hit the following KASAN report while testing current upstream kernel:
> 
> KASAN: slab-use-after-free in dev_driver_string from chaoskey_release
> 
> on commit: e8c2f9fdadee7cbc75134dc463c1e0d856d6e5c7 (May 25 2026)
> 
> The reproducer and .config files are here.
> https://gist.github.com/shuangpengbai/167620d391d9634107bfe4d784fcf52b
> 
> I’m happy to test debug patches or provide additional information.
> 
> Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
> 
> 
> [ 2019.816807][T10106] ==================================================================
> [ 2019.819081][T10106] BUG: KASAN: slab-use-after-free in dev_driver_string (drivers/base/core.c:2406)
> [ 2019.820996][T10106] Read of size 8 at addr ffff888168e8a0b8 by task chaoskey_raw_re/10106
> [ 2019.822432][T10106]
> [ 2019.822899][T10106] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> [ 2019.822904][T10106] Call Trace:
> [ 2019.822910][T10106]  <TASK>
> [ 2019.822915][T10106]  dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
> [ 2019.822932][T10106]  print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
> [ 2019.822984][T10106]  kasan_report (mm/kasan/report.c:595)
> [ 2019.823015][T10106]  dev_driver_string (drivers/base/core.c:2406)
> [ 2019.823021][T10106]  __dynamic_dev_dbg (lib/dynamic_debug.c:906)
> [ 2019.823282][T10106]  chaoskey_release (drivers/usb/misc/chaoskey.c:323)

The simple explanation is that the chaoskey_release() routine contains 
debugging statements that reference an interface for the USB device even 
after that data structure may have been deallocated.  Since they are 
merely debugging statements, the simplest solution to the problem is to 
get rid of them.

That's what the patch below does.  You can try it out and see if it 
works.

Alan Stern



Index: usb-devel/drivers/usb/misc/chaoskey.c
===================================================================
--- usb-devel.orig/drivers/usb/misc/chaoskey.c
+++ usb-devel/drivers/usb/misc/chaoskey.c
@@ -294,15 +294,10 @@ static int chaoskey_release(struct inode
 
 	interface = dev->interface;
 
-	usb_dbg(interface, "release");
-
 	mutex_lock(&chaoskey_list_lock);
 	mutex_lock(&dev->lock);
 
-	usb_dbg(interface, "open count at release is %d", dev->open);
-
 	if (dev->open <= 0) {
-		usb_dbg(interface, "invalid open count (%d)", dev->open);
 		rv = -ENODEV;
 		goto bail;
 	}
@@ -320,7 +315,6 @@ bail:
 	mutex_unlock(&dev->lock);
 destruction:
 	mutex_unlock(&chaoskey_list_lock);
-	usb_dbg(interface, "release success");
 	return rv;
 }
 

