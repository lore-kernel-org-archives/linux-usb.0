Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16E335C68D
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 07:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787643815; cv=none; b=KBlARBZm1DpRz5cpr5krZcRgz/b6xscypeeuiTJRJ1mwxs7RBG7OndGusp7unjmLOqQnB42K4c5gugdQwh+JIjpQH6AVy/A5JH3jK9Cd6KUcfhmvVvVaEY1MFS/TppIEegjikvkVHgFeJOux/X0x6K4Fy+ub69FOo7FCqZKfu/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787643815; c=relaxed/simple;
	bh=sLg8Ckk/hQ3NBVs8nL/RdwFJItCXw1At4jpUvXP85Gc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nBGwqRsAx3HVgPMB1YIZUiYw0wQfSdNWpqinjca4FRydx0nSdIpGNm46Yjb+O4hXldB0muKTBOtSzGOerbB1LJmsdMd5X9J0jpZtntVVNinS3kXe2ObLp5UIqPvxUPBJJf7aRV3T6vcAgQQ1qnswsvwpwAu/BwLTdK8NzkthWic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gWJZ9te8; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWJZ9te8"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c16794450aeso646345366b.2
        for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 00:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787643812; x=1788248612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=53BGkIX3YCtdYzektyoVFu0+GpJUKht1d2NbX/XeaVI=;
        b=gWJZ9te8J4edl5o0rlinczfhmd7/K7qHnv6x2x1sG8TrApK4meazHAymh4Li+euUky
         q86pykaLRU7ZpeN5cmKXTSS+b3A32FDA24UL0nzk4vWx7KLLEwRISsWeqi7FGkVVbKE4
         l9bkwmBEhXTMv04T2ESX4s7EvwMq1L5ZwYpcOs3Tic5Jpw/ZnE4Ox/fBJ8iKw2sXnGD+
         opa/TPH60fDQNQzpMSEI4+cbjgihYFtfOIVhN9POHLImbFPz2VtHgAX4xzBcpcMp4W6e
         9LogdN+f7AdE/N0RcdawYLTporRMuFC84g8rN6X7NHceNfZWV2q+CrOlUOCKCfR/wNpi
         9cZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787643812; x=1788248612;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=53BGkIX3YCtdYzektyoVFu0+GpJUKht1d2NbX/XeaVI=;
        b=crLSM45DFegtujd4mW5F22GgTh2nmhNMPOS6dzBW4m7+YkccGjx8FQ05hm7f/Eyk6K
         goVs3xUzA+eD7xaRBVKR8+ygbakuFEm33RlOy9L1PGl4eCHEwFGdRKXgpEeLKa3Q59hI
         fcsLYC+CZGwGmKvtRBhnAvLOVQHvLS2ZIxgioR6fT6MqiLHZp1acnTiXoy0pAZFNBq3K
         MDFg6ofxSkCfsucWbqoc3BDZPX3uwFQMF9RwdKNoQcGXCt/lbaplqmN264SgtVxPegva
         8x6S97/FK7iJknGF3PVO9RzYi7YFnQJexf5jek+Sgb81at5aEONVSJx66XcR9TBLng7j
         EeuQ==
X-Forwarded-Encrypted: i=1; AHgh+RrL5f3oad8UAC00l4wofj7n8afuevStgNLW6s50grL9xmX9k07+AAQgJhyABXjmVyeCpOLLb/flNX4=@vger.kernel.org
X-Gm-Message-State: AFuF++nTF1hT4dujPYltEVOHfGKZshF6J34NL+O/cW0JLE3B/CZLaNea
	mF2+/RyKvn106t47h5kflbGs+TOyDT0G6ygVZATnTSejBRmw82mURB2l
X-Gm-Gg: AR+sD10wGPjUnvz22fB2MbtkZsvH47BC8YwaPVmWtI1boFpnnlHevWTh+gstt13ULiG
	T4l9CSHsAeyt+Fty9Mm4P6plUTobHlGN4HynNT6eLlEgbR7Dowl+82LPCjjjfMH1PV1zbMMsa4d
	1OzxsqIjrZkr7mgnzAlB03JmCEu2//Vrv6XjqI0eC/VQpzND8b/EQxWRR52o97lLW0Wxbxti5zt
	IgnBu9/W+eP8t7oN8FwlHoBVMn2GCjMGJP2nGb9/GfEGSqohoSBvbJbH7zYe6QPuMVZM7JlkBdu
	gCUy2hi9YdL0hpYtwvEFj+hOMaSh/pyeZy5n7yJ1ulq/lIHEbD94+Hc8Upxp8BIh+5DQuZfhHhR
	0Jk+OMHqaplYIWmRFkwcA3OWUP5q7E356beoM+IJsnKYfItmjsbEcGwYSzDYYALTLII5Pl+Ph9t
	lNzgJCkEqrDxmIGiIOaDqQ70E2zJn6jRzvAt5ST14yMBJCBe3JEoXZsId61MFHK7yGd74=
X-Received: by 2002:a17:907:72c5:b0:c24:d6f0:1223 with SMTP id a640c23a62f3a-c24d6f20633mr953718966b.12.1787643811777;
        Tue, 25 Aug 2026 00:43:31 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f9cbcsm1852865066b.29.2026.08.25.00.43.30
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 25 Aug 2026 00:43:31 -0700 (PDT)
Date: Tue, 25 Aug 2026 09:43:27 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/2] Add larger page size support for USB audio offload
 path
Message-ID: <20260825094327.606072e9.michal.pecio@gmail.com>
In-Reply-To: <20260824-16k_offload_v1_b4-v1-0-49a6be60ca30@oss.qualcomm.com>
References: <20260824-16k_offload_v1_b4-v1-0-49a6be60ca30@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

On Mon, 24 Aug 2026 19:06:54 -0700, Wesley Cheng wrote:
> On some environments, 16kB pages can be enabled from the Linux subsystem,
> which manages the IOMMU mappings for the audio DSP within the system.  In
> the current design, the following assumptions break when 16k pages are
> utilized:
>   1. xHCI ring size is equal to PAGE_SIZE
>   2. Ring addresses start at the beginning of a page

FYI it's worse than you think - xhci_ring_to_sgtable() returns wrong
data and uses some allocation out of bounds on these systems. Quickly
scanning through the patch I haven't noticed any changes there.

> When the USB offload driver maps the rings (w/ the audio DSP SID), it is
> set with a 16k granular, which is a problem, as several xHCI rings could
> exist on the same page.  This is because the rings are currently allocated
> from the segment_pool.  Hence, potentially mapping non USB audio related
> rings into the region accessible by the audio DSP.

If that's a security or reliability concern, perhaps each sideband
instance should create its own DMA pool, as opposed to allocating every
ring segment on a separate page?

I suppose each 'xhci_ring' could keep a pointer to its segment pool and
things would work for everyone, with very few changes.

Regards,
Michal
