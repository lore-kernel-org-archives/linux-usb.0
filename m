Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E9B332EBB
	for <linux-usb@vger.kernel.org>; Fri, 25 Sep 2026 07:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790321868; cv=pass; b=pOkU0sao8ElJMQNufsIlC+um51fFIu5FBSoJzyUfVx037TAAtW/7NFKX9ggRFqVPd1D1enTG9JxS0vYcPEg0raDDUvKM3gtnaRJpts3mhjxxFYkdkX1XtxqjQCT8YRvu4EF54FTaLOl7WZo29AW7q5tVxlSkKrIrC0BF8q57uuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790321868; c=relaxed/simple;
	bh=4HRCApcqOCblV/nRa/gIhH9hhLpyjFWAyS7KPdKAl2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WIg4mE+/tDJWp9SzFil4drhFXCOy24VjRz6pkkUHnWN3r2hSxJZyW1LOiAefyhENOre9upuHvwaZ6l/NheyhRSzeGsEGuTy9vDFEAYBKSTvzeT461L8Ciped3HCDdjDeyPi9HqlluQXdo90w29gHxSA1dQqpH9zfLdayZ/+SMew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mQ9vFxFo; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mQ9vFxFo"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6aa13d8d9d0so7269a12.0
        for <linux-usb@vger.kernel.org>; Fri, 25 Sep 2026 00:37:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790321862; cv=none;
        d=google.com; s=arc-20260327;
        b=EHHcdQDavWHtl1/1ryyhgfs3RKmHZpcIvVVurwuEeP+k5Dcy0JBMIpobJ32LaN7xpt
         q/CeWAl4rvY53I6K9Nejmb9w53vIEiRb0Soza2BY9nWPM6hTrRbI5jfq3Uqo7K8PKkr0
         X0Xn9UdTdhAPrTE22aJIOsTVCijf+RICGPCd1+p0ZhzKoSVJOpQSeQJTI0FvdEdWASdl
         03iDZ+PENwE6/eGod/3Ms0Cnh/oXUq7OoMCKxSmud748osvPbSWPaWto7mzM2StjfyTD
         6NkFaCR82KNxdt20kv4GK3EU0Z7GJHZiR7FdchZVetY7q1tSRstiRldymd+HGnaZQ5lX
         91Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1Oc+jzCqS0Wyq/bTJh2/I4jluChyvqK4NXUNsIigcps=;
        fh=HVUJJNqke692iRs6lJ2iOP9E3rOIvBn+WKNIcmTt40A=;
        b=hD+RAyG5RPRVxtekzCkyzAwVQfYBJGkOs6UCH6pjtWtLWA/GoOPdqJYN/FnT+N4qbA
         kmIsT29RonojJD0V//Yyw1TcbCOx0UQRqxBLCg4nFqu6rEGjWnvsPD9W8EA9eAQE029E
         XvawpBARTUTR66y/eWd5njszpSCHknsc59p9iEdDb/Z/s4asQUPEqPcJe34E5d64xHpc
         WOB2gzmKvJZrqfAgU7G3jMN+bcKGf07N/zlCOvkaoRI6x1JFqI15yXb6veH5TKiB4rGG
         di5Cg57AIKnmwpBcewrLJmycTJtO2xNd13+ddS6JJVFgWNB946gmUcbTJuo0cjaT87vJ
         wmPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790321862; x=1790926662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1Oc+jzCqS0Wyq/bTJh2/I4jluChyvqK4NXUNsIigcps=;
        b=mQ9vFxFoabYALJuAnnXHoi1jXZaav9RmInZt43IwRm/fzvwjOopZ3o7VIc+dy42EPi
         9HROBxO8UV5pJ3vyakmz2OrfmdMJ5l3k2QVu7h7aN2S0ymf58OD7LXQehwoCCooGWSlJ
         MvGdJLno+5jm9IW1BGyaIVzD6rp/VRh1mI6TzCU97v5KFsxHRp89wyD14t2ZDP1tEBeD
         A91+ZQG6N6rJ0BcW3pG13YSmw/G2ukmHBfEkN3uE08LggWf2y9iU8nW5r7knfUMWHZRm
         YPH0c7LQUfotrpUgKUi9Amtde8tnp230k0vXLvU1SeSceyFG1gck3ElBqcrZJ09QAjWJ
         kRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790321862; x=1790926662;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Oc+jzCqS0Wyq/bTJh2/I4jluChyvqK4NXUNsIigcps=;
        b=scFdn+Thn62OWVwRY8MsVe/I91GZNSlS/f7n/rzt8nhYTcC+HcULmW6L3zDv780Le+
         aeg5lTO5scA/ib/oeasrdE/Vb+uXBVwoP4vNUIOK3rL1QfmUCFAlKtCd5iHtupB811Cp
         9JMllvXiAsxN/ECyhEyZCiz+9EPG6RvkLO/BT6ApEe6H0Td1AaxWueWPXBgIN1eFoi2W
         xsGKVa3OkD9Sk1wKfA86exjG0oR6mDwtXvunWx6nL25g6UXmznucaUwzeabUiNfQi9V5
         ScNWHqMVQIGYxB4kI6Hp1zWH0onyuwj3fI6+eSQTq2tWPkXdIi8o4fvx03HDYdnKeJQV
         NfxA==
X-Forwarded-Encrypted: i=1; AKwUvBzRugDhE8q5FcYzzXUM1vZkiCa3lr4OD/ZKLlzMDX61tiupLXyxxPE6nUUqGJVPIBtrFYAaQo+up8I=@vger.kernel.org
X-Gm-Message-State: AFuF++nryG6utKzZjdc5kGA3jGYf/a+bmS5bDkgAs2lm32dPeUdgkqhg
	IEaWv6uVMtOipLHWfKMkS9gEoQuEugjCoDSK8HNS5nXVzr1DefCewuKVVAOhoa6/8k+0Ba/UIAS
	6Vugz2aE8cUDtl0BeXrBbGURkR+iDyyb+siwW+hkW
X-Gm-Gg: AYBFou2wmNsSw1izcFoDbd8qgi/gmte2R1/iM7OiBwV3fndDrJv4mbS0bqUZYjMXv4h
	+KDpGK4sVNVrHWckRMUtt0MuptuGgophW6jWOfYov90ES3sNs7Tk9BVm7gbbi7u+lIyyOcUtbeb
	BRkhMbSP6IWnvyJIeXoBJYxmog8/KYrdeovJgtzNvFh+t0pr5dcNGG8ukuhxYdihg+1wu7ndgWI
	16ynatALbOqLbjKJzi1E21y8I3KzBmj4w2Elk11cfZFWcvcPnn/ow5wa+EwsL+q0uuXP2Fj/2lB
	G+/1E4ucRECA2NMBChi1J8aK69EgBAB3JcPjcNFAz7XTVLXYJC3aSA==
X-Received: by 2002:a05:6402:2714:b0:6a6:f2a5:1b4f with SMTP id
 4fb4d7f45d1cf-6aae4729638mr36915a12.4.1790321859803; Fri, 25 Sep 2026
 00:37:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-7-4583d8a23bca@kernel.org> <DLNSOBMBHIVC.22QI9YBL1U72E@nvidia.com>
In-Reply-To: <DLNSOBMBHIVC.22QI9YBL1U72E@nvidia.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 25 Sep 2026 00:37:26 -0700
X-Gm-Features: AclHuK_RUT9CXNFLpx8ZY_roLEZNzp5S3oNdpNL4cW25fJBFg9wRGnSWohuMdYA
Message-ID: <CAJuCfpH6AF-hOo4jU6OeNVpd+fgpqLpmcfAGs11J=nPCgAqG_w@mail.gmail.com>
Subject: Re: [PATCH v3 07/40] mm/vma: tidy up map kernel pages enum values
To: Zi Yan <ziy@nvidia.com>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
	Doug Gilbert <dgilbert@interlog.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, 
	Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, 
	Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
	Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, 
	Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, 
	selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, 
	fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 12:31=E2=80=AFPM Zi Yan <ziy@nvidia.com> wrote:
>
> On Thu Sep 17, 2026 at 12:22 PM EDT, Lorenzo Stoakes (ARM) wrote:
> > MMAP_MAP_KERNEL_PAGES is a mouthful, discard the MAP_ as that's implied=
 by
> > MMAP.
> >
> > Also while we're here delete useless comments for mmap actions whose na=
mes
> > clearly indicate what they are for.
> >
> > Also update the userland VMA tests to reflect this change.
> >
> > No functional change intended.
> >
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > ---
> >  include/linux/mm.h              | 2 +-
> >  include/linux/mm_types.h        | 8 ++++----
> >  mm/util.c                       | 8 ++++----
> >  tools/testing/vma/include/dup.h | 8 ++++----
> >  4 files changed, 13 insertions(+), 13 deletions(-)
> >
> LGTM.
>
> Reviewed-by: Zi Yan <ziy@nvidia.com>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

>
> --
> Best Regards,
> Yan, Zi
>
