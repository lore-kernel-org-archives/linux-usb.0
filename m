Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC5A48551C
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 15:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790265540; cv=none; b=kfnkKCt5vCa5XC+5G7g+YDGjj1zBL1h2+ZyT6uvsjLB7mbe4adqZKuqnsWGzk0pTKBcTUCIl8BlZfc1B/pKsRKS2g71ODUgMYzU08BfOdEcb0qj9JmwAGZDE9BPYi/KRnVfH31IWPklTjaIIgT5NVazcK2A9wgT1kxeTtVyrNnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790265540; c=relaxed/simple;
	bh=ToZiJAkrgSQjnwLoDYw3SVpjhOj4jykTv5lAwrFa0Yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PkZmlHelNfaOMKDJxN3ubmcixitFxVpfVCUAaDO18Qgg6SuiTkZbJdFMjgYumdUK9b2kqcQW1sWD/SWNyMtApNlgTaM8D2NbLS6KZwhifJo735RtAQ4nqulIPYa6pTBIfTuTY37j0PSQipkV09/8N5csUAoi4XbbR6lWBRF4XY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GkdUHKOQ; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GkdUHKOQ"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-398cb5615deso26476a91.3
        for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 08:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790265538; x=1790870338; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5KGLf9MsxtpwWwESaJj6FP5rr/2irrSyQVnzSf/hNug=;
        b=GkdUHKOQBomv5z7IZvuF7r1UPCrso9OxbUfP3/s+xKpEjFvYAt34LqJZ62S9KD6OCE
         ElwUqQWQrDd6mA+C2k8yLTLWWM9g3GvkEz3H1K5TTgP9FhRUSI24gk23Lwl60SERL6pW
         lOecBE0iAiwYZu/yZH3GK0TWzEbMIkih2A9mMYI61dwY3uWqQAgUS/AjuKsijhX6jHdd
         y+mSUwhg+u55iAqSUywzWDjMOeCCyiCAmeugrW8oZemNbNJ3HlPolVFa9NDajaJCnVuA
         dJdIMJv5zMZoLcZCReyEbJLb76tHEGdJKrQNS2s5AvOQcDolxrTI+k9RFpW9y3IfHGuM
         g+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790265538; x=1790870338;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5KGLf9MsxtpwWwESaJj6FP5rr/2irrSyQVnzSf/hNug=;
        b=uu9x2bjK611nyEOcuNUYIo2w3lKCw4JRQtRLLkhSG2gbKPo4P5Ke0jJmCaPfzOpT8O
         gVptZ0jKFM0KpQxAKYu3NyCeJLBW2gmi7kbj+km6JaZcVEPKQ3hzin5GoXFz7KuPV7fv
         vjJeg9oAE0x3Ui4wz3IplVgacszgVtX4hm3Euo3d3n9gHiQX5Z1b5Q2yHx8tt6sx4X6k
         L6Pjmd6zLBNLsSw98iTdL2R5r1rnPcxDIqybqw1cokhlzHyOwvJbQwUrGXHlh53Sx3Cm
         CJ+4ttxBIUOOZqFi7o1wOOFdhqJC9klpcShmkeslfTm6YtzWzNP6crdUQ2bi4pfI29ju
         xrdw==
X-Gm-Message-State: AFuF++kNeyDLkL5DCj0ouqGTXvcB8mUTX0jUe+OrSGGmEPeMsCILsnol
	Wfob19pEk6e3vRUg1YAww61dpQldQ8gYPlb0rbNqiWPLIkjDHOI7Vqep
X-Gm-Gg: AYBFou0mRWaHgFYIgZ5J78PNhkZsRklta8oOQAPmFG0bYW4SLLsUtA5FRYtSGfzXRno
	AH1mAb7vKcqufwaY+PkfykMaFFe4nAQk4LYg1MIOxBjGzltc/YzLpe1jw9KZYDuUujvtrZXz9m6
	+4Cpa7M7/21HewRzToif22csRoxNDyM3euTkKlY+g6aleTdE7KfAZp0dMqtD8X67DMH0zWmbKzX
	ubjsBe/2ipIUCX0DLs8dUgdafvJzwgZ7JDgZ7/9M536jbnsNS+PIF2+jbMp7+4m4U4yrcMVxM7W
	BpfQsJD8XXj7PdH1s8sTqkwlg89wOw+xLaPYHBvNDusPYDTnTSTtGKIP+UqVBBDmpykEo+8sUnj
	Bu8B08EFdJUxUCYBRSgx8ahn3eCSB5OEevWryXnrIWTlJI0DxMA8K/oRJXhSzK8l4pxhuWBcITI
	96OeIYhSrJceKTrrL2yNVW5du+neVs/vuVSsL0CgdvlC2+P4GEDc8mlrbctUF9lYPD4DPOFv9wB
	wwTv9ls3bo9n5j4yTO2YPVsbu+IxGyPd4cBJtoc1eikas1xS0n0WfKVRUxsYLk5OvI=
X-Received: by 2002:a17:90b:2541:b0:39e:6c69:9b9e with SMTP id 98e67ed59e1d1-3a0992905acmr2305095a91.67.1790265538423;
        Thu, 24 Sep 2026 08:58:58 -0700 (PDT)
Received: from archlinux ([2405:201:1b:20ef:de2d:6e5b:74df:ad41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972f111csm5690428a91.2.2026.09.24.08.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:58:58 -0700 (PDT)
Date: Thu, 24 Sep 2026 21:28:52 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: sjunhyuk1@gmail.com
Cc: linux-usb@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [BUG] HP OMEN Transcend 14 (board 8E41): GPU power ceiling on
 65W USB-C charger is non-deterministic across sessions (25W vs ~65W)
Message-ID: <arVGfB1PV7kt2Llq@archlinux>
References: <20260922192312.40607-1-sjunhyuk1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260922192312.40607-1-sjunhyuk1@gmail.com>

On Tue, Sep 22, 2026 at 03:23:12PM -0400, sjunhyuk1@gmail.com wrote:
>Reporting a non-deterministic GPU power ceiling on a 65W USB-C charger,
>in case it's useful alongside other recent reports of EC/PD-controller
>firmware state issues (Legion Pro 7 16IAX10H, ASUS Vivobook K3605ZV).
>I'm not certain this belongs to USB Type-C / UCSI rather than hp-wmi,
>so I've sent it to both lists; happy to be redirected.
>
>System
>------
>Model:  HP OMEN Transcend Gaming Laptop 14-fb1013dx (B94GQUA#ABA)
>Board:  8E41
>BIOS:   F.05 (confirmed latest via fwupd/LVFS)
>GPU:    NVIDIA GeForce RTX 5060 Laptop GPU, VBIOS 98.06.2A.80.62
>Driver: NVIDIA Open 610.57.04
>Kernel: 7.2.5-3 (Arch, Omarchy)
>
[snip]
>
>Separately, this board also reproduces the NPCF ACPI-binding issue
>described in NVIDIA/open-gpu-kernel-modules#1162 (Power Management
>Object stays N/A, Dynamic Boost above the 50W base TGP never
>activates) - confirmed via acpidump/iasl decompile, same topology and
>field structure as reported there for board 8D40. That explains why
>>50W boost never works here, but Power Management Object reads N/A in
>both the 25W and 65W states, so it doesn't explain this particular
>25W/65W split.

Hi,

While I am not sure why it switches between 25W/65W, I can take a look
at why Dynamic Boost failing. Can you share acpidump please?

Also Ilpo Järvinen, I just observed: when support for their board
(8E41) was added in hp-wmi, the patch missed the Signed-off-by tag [1] [2].
I am not sure what we can do now, but just informing you.

[1]: https://lore.kernel.org/all/20260203164832.40514-1-plotnikovanton@gmail.com
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/platform/x86/hp/hp-wmi.c?id=729ffcffa73069cb066fd54a2bc7b09e5f782d48

>Full write-up with raw capture data:
>https://claude.ai/artifact/WDAN76AWk1JpW49ZSGc2Cr
>
>Happy to gather more diagnostics (EC register snapshots, more repro
>counts, anything else useful) if that would help narrow this down.
