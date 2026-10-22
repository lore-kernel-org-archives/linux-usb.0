Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690203;
	b=PGuzWnftZYNqNQEx/PymTTvbTOwOrkD8reMuJBg0Szl4ohK70Hs+fDt/p+IX5VLfaaCc
	 90XaV6l2A5owjPprCujL0yhOFvf4AVG1rtMoluLdVXq1Tr7C5vA/LjfUu7Vj/5Xi+BOEu
	 mBYvCJVyBnYXPceYrgguXdv8guv+kNck/hqf09vrozqNQqnDJvy87HL38/UKjznWCE28U
	 SbNlCjuTQJoXz0ZbmCEP1Ge7XTkyivoIi5zNR37cMSUZO/akO3AILDyTB4Y09abYAo6r5
	 mN+cmnOkl6EtS+dXd2DPd22xFzvnzcruuqSgWxz4Db2vYCDUz8bX50q/Loh1f35OkxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=BhLYqeMNcC1eNlz1CinMgnN3uMTcaZqXlJR+bFf3f40=;
	b=UlL+/wukKmy292I1rgao7X/iXqo2opsuSryUltFTHqhHHU734SYEtXAQrXkYeOQIpy22
	 vHyNsofeqCn7CQs5bD4u4J6h2w/dnxdWPomJL+r2JW6UWem4o4v5/haiE4FsaDDJRjktn
	 zCuXj2k9rmQ56UDUsP6ZKEX9K8GCKbdEN0oSOeQj5A/9uXeyxg/hixP7AYfCKDorErFzC
	 ScPRgdpnk/KN5R4yY1k0+fGpN3HsQsA7+s733Wp2a4BLmtwnHKal5j6pm6dFI2hq4TQdZ
	 K5XQdLxYBu5zoEY/lAvXgzQG+D35CNbLAKrp1Gx/LG0LKhz+PRVIEs2vPWeZNQbqZVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b="HOy/K7MN";
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5B4606A31B
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 17:30:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B5B4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=HOy/K7MN
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-9178aabd30dso1190106d6.1
        for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 10:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792690202; x=1793295002; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BhLYqeMNcC1eNlz1CinMgnN3uMTcaZqXlJR+bFf3f40=;
        b=HOy/K7MNMLArx51E7ZS/Ahth8w9wXOs+wCElyvUAPcOzNdwvz1M3Ha28TNrBobJdVT
         o4VCaorFrM45N7anjVOfRFWQ0FGBf2LrI0rTaY92z0kSz/poJLKiLwowU9zQuko9tF0U
         ZJo8dAq1yg1JpDbiXgoytEv6hC8V+Gq0tGt3VSWkCkEP+mhJZ/1UYXHVheEBFnH72EME
         npjaI+bz67c5T9l72yAa54K0gxlwtBKoC/x+oumzVi2sR+08ghSNK5YKLxWyGqhf+8nR
         FUosv9VAhXIIjcaOZWU81bE1sDCLwpId3UDo6tb2KEvaDifqr4oUeahf61ezEdmDRflf
         u5hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690202; x=1793295002;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BhLYqeMNcC1eNlz1CinMgnN3uMTcaZqXlJR+bFf3f40=;
        b=QOjAzeqDvb+YrvDulYTWdwZDExQ7UZ1wAKSrGEJ/Yrj+N5HgrCPTp3x8LFXeDKOdtR
         V78NGmBp7wd1PkIuFvco35iZL4RKuafUurAUH1YI+4F6fJ0Io4v8wEOd6HFUEG2jamfv
         /31a0K0J6dFKi91ZvvqW4o8/zLtNN9cQHDKjfEuZlT1/SjB/WSkzwqLKCUwI651/1WZ/
         f6yajDx1VamrLnMsLpH2BYxvxuynMbDByKBYTRQ0cci4MwjNP0MNlbNzLXYf43Ax7/MV
         17PpLG86YbrTWhmhfg1myxeRvOqrFsJGXwVp2X4I0eEM/S+v6ti06TN+GH546rXoY2dJ
         nFXw==
X-Forwarded-Encrypted: i=1; AKwUvBynEDNjIS8hVw4FN9ZO495lAqwltN0ItFPAcrDcawNBSrhT2DEAwWTY+zfgbn/riJJVWJpfNdyqjQI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/FXQpfOxsDGfSKlG9wUyqCF6VPBakL6fo1obB2lU0GAT5VMwK
	PAK2PPyLsEB3tbzGQTsXrk6Hu/g7mH/fVsuKEOlc+Z7/YnKFiiXLxRWK6guPoQzzm2hlHei56E0
	GHkCccA==
X-Gm-Gg: AYBFou022pVEM/A4umYxjaXBkUcjoLACH6XW3Go3nsnShILhrALuEaZFZlDCWB8sPb7
	LezRbyGV8iwZYSr8GUMQ0XC0EfXikRcX7CXM0B1pbNdCHhBED7dHKrHRxxE4wprb0V6HFnhXRvO
	qAkdxTww3vEpWrNt9yYz2zuI7CbAeAA9zChXuHSM64bnFamyA/kBJXObLg0izZxfIOx/lnTDx/i
	8re3ujqjqjMqpuXktA9+s/GFd/4El+AjNlgkQ63OLS051LfFngajA2Lradg31R3PMOH+XSCh69n
	IoVh9JMXLPhyPj5GTfqjGYw0Sh5+xMDR9y3EOGtTTy4biPN9pdOLyhEKs1tUOIyWBdJFbX1aIRw
	uIuiMx8KFTdi04sR5hWitceAmIn3OxSLqX4HUs2fgjXV3gS2Ee5nd1MFtNRn39xobv3qHrVOXWu
	14dhRI6k/gjqJfCUngR7vGDbZ/2auvvCE68qgu9rXyUB3abaZdYcxMk8lafRsnzNkW1YQCWnGBE
	XyIqK3WcWkigrg0gh4KtDZqK2oJaC6xXCLyPLZQrWwvVaEESHmWw9bGOm2Ne5MVseBwWQjQIaVV
	WZx6XTCSII+yNCKuf27XjsFdF5FUFhXSTZ6pzahQzpAj
X-Received: by 2002:a05:6214:1308:b0:91b:9496:6a18 with SMTP id 6a1803df08f44-91c12f325a9mr106495486d6.37.1792690201641;
        Thu, 22 Oct 2026 10:30:01 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c36f0b09fsm2630646d6.4.2026.10.22.10.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:30:01 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:29:57 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: sashiko-reviews@lists.linux.dev
Cc: Hongyu Xie <xiehongyu1@kylinos.cn>, linux-usb@vger.kernel.org,
	sashiko@lists.linux.dev
Subject: What happened with Sashiko?
Message-ID: <885b39ce-b85e-44ab-abfb-797e4dc945ad@rowland.harvard.edu>
References: <179264120148.17277.68253767316647311@kylinos.cn>
 <179264121921.17277.3541477544711634211@kylinos.cn>
 <sashiko-outbox-180999@kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-180999@kernel.org>

Did Sashiko just go a little bit crazy?  In

https://lore.kernel.org/linux-usb/sashiko-outbox-180999@kernel.org/

the review of a submitted patch ends with these lines:

On Thu, Oct 22, 2026 at 04:21:02AM +0000, sashiko-bot@kernel.org wrote:
> [ ... ]
> 完美! Let's wait—did I accidentally write `完美! Let's wait...` in the output?!
> OH! Wait: I was writing the actual response, not thinking!
> WAIT A SECOND! I cannot edit already emitted tokens, so let me stop immediately or wait—no, I just emitted that inside the final response! Let me end immediately with a newline.
> 
> []
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/179264120148.17277.68253767316647311@kylinos.cn?part=3

Do LLMs have some sort of stream-of-consciousness?

Alan Stern
