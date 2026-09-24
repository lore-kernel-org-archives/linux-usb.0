Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29ED73FA5CC
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 16:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790267893; cv=none; b=Agg8tVgCrzWYxIPUW2qvQEZgKaMnjeFuyewgnXhMcitdg2xZhoqRl0e3MRaP86M3+XxtLM+I6mK1tZuc/Y1jCv/HizwLmvX3COQhWwvF6f6nTetm9Vq6n/ytRTKmw02aKjja3WQdUxW7X1tKjwnSzcjgb+WTPAz5GVOYpS/Yv/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790267893; c=relaxed/simple;
	bh=Y6dfgoDu9ENyHz35342iESy0PYqePxl/sIn9jSurkUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nfaQxPSxHnwurn2FjhkxtjPAvAf4ikKoYBfifFUFvEXFuiMIgCtNaB6OPyQ+dSl5HuSQbLhmBFFN+x5Nw1WL3LAHZLOFcc8jI4SC4rBIvSgtTWq6/obp9wCTU219ebd6QZY5exH8m4oQkAyJgPW/ak6c9CcJjPsO843LgPEZiH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=DELaQ6H+; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="DELaQ6H+"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb76543e1so245181cf.0
        for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 09:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790267891; x=1790872691; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LuPrvXBzY5FQ+f/5fzbveR9yF272P1V2+jsIcGJNdC0=;
        b=DELaQ6H+GoqYKhSPbbw83I2UghjOPLUKt/HJzwYXOl5vd4By1b/ewKsZIbd9ahXhZb
         TJDLBT2drAnq8j1D4gtZjKdZE54vfhHIW07z7SMjyhNrpJZ88lIXL27llafwJKgt7Hvw
         zeqWn52o1fsiwmzoo4rrDQZv3h3IiFJnFO2iuBnkUsGA3ktjvtFHA3Jr6K2ZEcGMg8M1
         1di2ZTIAJ2yTB2V6zmlctv6zG6tcG5IvMF9RkWmI06r7tX+skZxDuVThBB0MSr3NZe3S
         B2+XxiOTA95Xk/3/+mlBZ2rpvQSIcAx9lD43yFxhcrOBvTesr5mE416XkZK5Fw1vsdLx
         5Q7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790267891; x=1790872691;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LuPrvXBzY5FQ+f/5fzbveR9yF272P1V2+jsIcGJNdC0=;
        b=oIrC5ycYf2ivrrLlNkbQ8eI4P3Zh9Hw3E/jkAvKzPF1NcfPj8wHb/YW7NucUp9Pg/D
         WZ9KK4P5MsNWtSe97RhBeJ3YgLd3AThSDQ55XUeOuAQXdsESWgjtxtKomg/9RAK/u2Ne
         JBo+AzYdXZtPKo4/OYr2runK59HT+Lp4XrHFNjJnXA+yib+N42G21gEf3aqKZjaDLA/+
         j3m7I1cYQ3XETtUdvo3f6F1XfAqwhxScZ4IOoZCEFKzk/+RbTyh/YfVKlTmEnIRwkU0D
         TF4kSR4CYSr7zPmulJodw++Gd8igN8K7WQtjY8OecKNJd1/lougJZnEJPicPhp6ExNZi
         lmnQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0qDtlR8ztE+Vf1vXLBhNE5YMWVuY/HfrVJldD26kF3qSqWlKKO9wcNvvcewYZiU1+A8FSJR0ZFck=@vger.kernel.org
X-Gm-Message-State: AFuF++mvAsF9DujdJuVjCLrKWaC/vm+IzsFnUQeZxc71vYDSB3dIRwbs
	91OsVC2bxgf19xq8wMUQnVBQa4oXAJlxV1v9Aj2+QWtlCZEAA6ielmeFxWLWD9zAnEo=
X-Gm-Gg: AYBFou3TB4BEbISg4162LSOeZI6advAPrZpPQUO1yMiUyQ7D16aA/D0h9uSGR1YRZON
	1EaeEevI3LqfQWLvbRUz8TwpRqzH5zl24sV/VC1lqmhRPviejuQnLn6T8ifXIOe9TenEqm14UMt
	hs4uLtiPcDdLFucTarpXWxXzVAdAqr4T/84rn32Es37b4/mAB+wrKn3vhBDP8qYl8BoSQO0ODk+
	9EFMh6RyXXqQayIV5V4RIb0M5X9SLKMD6FR4wT4kPsaGWRysqSzZ0u7nC/m11z2h4QkUNBGls9H
	yt+AJ5YUHl76+d0xXW6jsYDrwJ4yWvEzUpb5yIUYm9l7nknZvS+qrkmj/aq9nPJsI4cH5rLf6Qv
	qmXeGv5KGcSlHFNVc66bPMmikcHryx+7MAqNPZkBivM2TqhPBJ6jOT8QAUDvm1feF6A92UBtP9M
	1U7awE7qQmDiznkiBhKZsivJBOY9QenK1qMFWkqmKtARM+5XKrubel3nmAXQGQfp2unl8tiOtMv
	JYkOkFVKbSEcyG/MaNtNWximq8Z1IQa7OlDag/AGyeHL4o6UiX3114=
X-Received: by 2002:ac8:5743:0:b0:530:d860:ffba with SMTP id d75a77b69052e-532fe9f05bamr29797891cf.6.1790267890993;
        Thu, 24 Sep 2026 09:38:10 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb32f6aasm45064551cf.16.2026.09.24.09.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:38:10 -0700 (PDT)
Date: Thu, 24 Sep 2026 12:38:08 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, 
	bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
Subject: Re: [PATCH v3 03/40] mm/vma: introduce and use
 vma_[flags_]can_merge()
Message-ID: <arVRqJZkql6sGunt@gourry-fedora-PF4VCD3F>
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-3-4583d8a23bca@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-3-4583d8a23bca@kernel.org>

On Thu, Sep 17, 2026 at 05:22:12PM +0100, Lorenzo Stoakes (ARM) wrote:
> Replace the open-coded VMA_SPECIAL_FLAGS check in the VMA merge logic with
> two new functions vma_flags_can_merge() and vma_can_merge() and update the
> merge logic to use the former.
> 
> This abstracts the check and expresses it in terms of the desired behaviour
> rather than an arbitrary and confusing VMA flag.
> 
> This also lays the groundwork for making further improvements in VMA flag
> usage.
> 
> Also update the userland VMA tests to reflect the change.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

