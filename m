Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35A73E9C2B
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 12:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791291359; cv=none; b=LotopVb+Ow6XbWOnUMOkd1AuSRuTi4qm7UcAscYd3FUo32p8eWEU4SkI06CHIkH0F6+zrjnvfgDn1VYiSfRMzFJaV6g4nHgzcaeR1i4wsvij+UhlGIktkx6G1NfruPeKBuOHEyi2UruF4q9OSrhtT4dXwT2tm/wBaxxe98L7f0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791291359; c=relaxed/simple;
	bh=7M3N5zc6rouo/kMPltraL1q8cdAqQbFSDbKggtIuJG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SheDY4a8f0sJzK6HXqWq2dGpl5sAvLueh+gRQjT0CUOmRQickQurqaxuefqQ6ANnBpOBwt78QvBjK6a8ff6k1MGxeoA/2bepi7tUEwHVrWycxC3Q7UBlniGl5cwYV8saZM9DJO3vfv40s+LFelYvZ8zDUJG0kTFBY5+JCAIu5WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HPsqiguG; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPsqiguG"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2e8e738ae0so76975166b.1
        for <linux-usb@vger.kernel.org>; Tue, 06 Oct 2026 05:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791291356; x=1791896156; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TwTX2vFVLwqe414XJoJKYPBRR3bUAEgGjQ357/htVY8=;
        b=HPsqiguGltOqVl2Yuxek2y/GcSHRwT5V8J5log+kYAGnMzvj8dj9S/mn6Uk7DkxxDq
         2sidZC8tjj5SZT8O+4C1d2XKri0+j5jjLtk6x7d3hIDJX0D+eTDbsy90djbzhBeUU6dq
         Z/6zpxHjkwCF3/SvCocs851u+glgB2kxRhh3d4TwUmgPt5Uq9r7eXWtiUis1Mw3siRj+
         mSmCe/Aln/hGJz9rgqkskfy/sxdbxF0H+hJlhYHJlnv+bhb3UChMPzHbVvA/6qk39PV8
         GuGdzUDzdCni8f2+ByJxxwfgvx/EzLqiVGfp0GTVJsBnEhhyN21QsWZlF0/l0rNVA9EV
         coPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791291356; x=1791896156;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TwTX2vFVLwqe414XJoJKYPBRR3bUAEgGjQ357/htVY8=;
        b=PEOnvkkUPgetzGxIyUMCjj/KJXufoPGKEi/ShPULFyaHzKmqQLvBIwmNN51impo4di
         nIx+ce6JTZaBwTCGCIBW5GteYbNtc/J1JvZbpzBpd+rJ5ABXGue20EzZx0k6Xbdue1wI
         Ior4OHuZtVR/PSXtJZEYXKXwIDJN8U9FhZLAS1HllFgJ9O9BjRj80k/IV3pUNmIRb03d
         rwTWlTfRaHDgjT6ANDwx8e9NgTIQ+7M6chocrhOqilYybWYYVWUpsbkKpxwm3t9pY6+d
         7rF2QBE2L3JRf1q+BueAwESfnwNf41gHAcRT4eJ3uCj0tj+GL+zuu1GbizLRw3o6da0s
         pwfw==
X-Forwarded-Encrypted: i=1; AKwUvByJO79n/vA73ANexNv6fE9YgNkgJGvNrT5+GTgeaDr0BOTOD/wYR7pMsy2DFTTSp8RW+nUvY2/x2S4=@vger.kernel.org
X-Gm-Message-State: AFuF++mOLqrM5K89HnU6xWv14zoNrdbvgijoPDN/JdhRJcPaVMQHhepl
	t1Lp+SOgkKLH/ckszgm0GGAgYj70bUGC27/cn1Cr5rJ7g5/UoBeKRCzi
X-Gm-Gg: AYBFou0yEtAb2KJA8x1Mbhvzrd02uj1wMEKG5XpSrns94dNX/GViwmD/D+4y+K13psf
	T9pH4xro9lJx8gudEYvtCVJ4lGiVy4+GRtb0x5SmJvceSv92M3umPDjiESM1NnICClhNTb2FMrM
	383zPKRC3QCa+Hy0iBGwSghDWlkZNrfKHHHpdbWcoLyIkFP1JgyPb5ori0mp/qDBF6AhvPDX+o+
	TVXFmH4nwt9nbB90lR9t4yEoXvdG2Me36qulmCUlanW5JsSvS1J7wrxrkIGPEm6JQ+Dcu2M95Lz
	Ia1K70+q6+9MvwUZWA09jjPqo6m6Rhu3qdT4WiTUzYg+5vkLvMBl4fi/tHjJNkSAnAsrcnv0Tcq
	Pwgrh0f2FrgNiUg9IVtoQcoOSJkmfJepAOv8vbD2VsV54J/6qpBCqRlOvbsEgGrCzzKiPf/WFQH
	8p3hwutG5k5LzK5o6uLiANqli0VJoa4jV1exU8FKYkhm9vyXIS7CpZ58X97qPihR8T6EcxT+JGQ
	cqMskWuh5uc9O05RtURpSZvRSJX3xZWMJo/DSLJsdDdjgIHAw+p6JA5+lJ5jxJyiokYdLF0R/uU
	niL5yzggtcOTAyNZFkTsZ99uF+9Uu9QN4vnhfLk+a55wQw4fAiM1cdc=
X-Received: by 2002:a17:907:97c5:b0:c2e:3e3f:e201 with SMTP id a640c23a62f3a-c3169f85d89mr129066966b.11.1791291355731;
        Tue, 06 Oct 2026 05:55:55 -0700 (PDT)
Received: from XPS-17-9720 (174-16-208-129.hlrn.qwest.net. [174.16.208.129])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3156339a6dsm200709666b.67.2026.10.06.05.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 05:55:54 -0700 (PDT)
Date: Tue, 6 Oct 2026 06:55:51 -0600
From: Jonathan Gopel <jgopel@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: andreas.noever@gmail.com, westeri@kernel.org, YehezkelShB@gmail.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] thunderbolt: Do not RPM complete unrelated subtrees
 on unplug
Message-ID: <asTvmqoWBBCCA26h@XPS-17-9720>
References: <20261004120255.GI176164@black.igk.intel.com>
 <20261004171404.448474-1-jgopel@gmail.com>
 <20261005113822.GL176164@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005113822.GL176164@black.igk.intel.com>

On Mon, Oct 05, 2026 at 01:38:22PM +0200, Mika Westerberg wrote:
> Hi,
> 
> On Sun, Oct 04, 2026 at 11:13:50AM -0600, Jonathan Gopel wrote:
> > When a Thunderbolt device is unplugged, that switch and every switch
> > subsequent to it on the bus device list is `complete()`d, not just its
> > child devices. In the case of multiple domains, it may cause, eg, an
> > attempt to `complete()` the uninitialized domain 1 root switch RPM
> > completion on unplug of a switch from domain 0 (though ordering is not
> > guaranteed numerically sorted).
> > 
> > I initially noticed this issue on a Dell XPS9720 when the system would
> > seem to sporadically not wake after unplugging a Thunderbolt dock. I
> > tried multiple kernel versions including v7.2.7 and v7.3-rc4 to see if
> > that resolved the issue, but the issue persisted. Eventually I found
> > that I could consistently generate a kernel Oops reporting a page fault
> > at 0xffff_ffff_ffff_fff8 on unplug from one side of the laptop and went
> > bug hunting. I became suspicious of the `bus_for_each_dev()` walk that I
> > ultimately ended up changing. To confirm this issue, I did an eBPF trace
> > of `bus_for_each_dev()`, `complete_rpm()`, and `complete()` while
> > unplugging in a variety of situations and found that an unplug from
> > domain 0 tries to `complete_rpm()` domain 1's switch, whose RPM
> > completion is not initialized and thus is holding a null wait-list
> > pointer, triggering the page fault.
> > 
> > Here are the key sections of that eBPF trace. Note that HEAD denotes the
> > completion's own wait-list HEAD:
> > 
> > ```
> > RESCAN_ENTER domain=0
> > 
> > COMPLETE rescan_domain=0 target=0-1 target_domain=0
> >          route=0x1 parent=0-0 unplugged=1
> > COMPLETION done=0 head=HEAD next=HEAD prev=HEAD
> > 
> > BUS_WALK domain=0 start=0-1 callback=complete_rpm
> > CALLBACK_ENTER rescan_domain=0 dev=1-0 parent=domain1 is_switch=1
> > 
> > COMPLETE rescan_domain=0 target=1-0 target_domain=1
> >          route=0x0 parent=domain1 unplugged=0
> > COMPLETION done=0 head=HEAD next=0 prev=0
> > 
> >         complete+5
> >         complete_rpm+43
> >         bus_for_each_dev+133
> >         icm_free_unplugged_children+250
> >         icm_rescan_work+42
> > ```
> > 
> > This patch gates the `complete()` on an additional condition - that the
> > Thunderbolt domain matches the domain of the device that was unplugged.
> > 
> > I only have a single system with multiple Thunderbolt domains - the Dell
> > XPS9720. I am consistently able to reproduce the Oops on that system.
> > Since running with this patch, I have not seen the Oops reoccur. I have
> > also tested it on a Thinkpad X1-Gen12, and that system boots and runs
> > well with it, but it only has a single Thunderbolt domain, so it does
> > not exercise the multi-domain failure case.
> > 
> > Assisted by: LLM
> > Signed-off-by: Jonathan Gopel <jgopel@gmail.com>
> 
> I dropped the Assisted-by per your previous email, did a couple of small
> cosmetic changes to the patch, added Fixes and stable tags and applied to
> thunderbolt.git/fixes, thanks!

Thank you so much for your help! It was very much appreciated!
