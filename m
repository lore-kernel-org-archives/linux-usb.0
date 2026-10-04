Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BBA4756DA
	for <linux-usb@vger.kernel.org>; Sun,  4 Oct 2026 17:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791136379; cv=pass; b=Wt3WG4PlPC4SbrAidVdpScS2jXMdCglgUfLW9fYvWEyLy9sd38/2+QJVePsM2aPzjiJ+Bbts3sspM0INrncGgAIMgY1VjmaK45doiK76Bgkuh9XE1VFCauB5VdeOj/KVliDQWCneYTCz+z0F3I7l/z242IOj6NUlkuodSj1N+ok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791136379; c=relaxed/simple;
	bh=eeYCgGHTFzo+FfXl1bPEgHkObEBq9XqafHlu3/JsXdI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aSP6L5qYiFCpz/C6uVs/nC9ESceFh1ZfNiwJJerLLtH+nYBK6RkkLRmglnaZtLCQB9oXyfrkOH2rVj+BiNK+o8skRcSJpb8BWp6eOfpV3rpNnOrjLb3TjEfk5+Gc7vR7xIaE610DELb7i1TS3H1zmLCfdjecsI/jH2SsIMxbgkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fO8wObON; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fO8wObON"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5351f9dbfe0so96961cf.1
        for <linux-usb@vger.kernel.org>; Sun, 04 Oct 2026 10:52:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791136365; cv=none;
        d=google.com; s=arc-20260327;
        b=jh6iB9bdqFzl79VeQFDaa0cPwMn7KR7t+4wgEkNytz5ksH1BIin19JN0q8RX6iLtsU
         KIz3WUB5WIyCtehV2Q++nr7NOuIisfaagcs/R5uYtiR5sPJdkgPXGemSn0f3v+U+G1YN
         0QQoiClEqCMvvUUswH7iJaFzmd0ez5h9yCk5OZitOtRBjmUmTcN+623F1Ym7K28AN33m
         Uj96WFDwyDNXi0OpsxRwctFmaXGENaAG1t37RllDnonVV2rmIDgm3fpM/yNYkvN+cwJU
         Y0Y2X2z6/zZAOBJlg6YILh4lm9PGCRK5Q3rgIUai3HpKwNIsB8n/Nx4sua+FoHX9pcJg
         H+jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hGuGLrOvm4LeUyfXJ5B4JaitM98XinzaQN/wjAvVcwQ=;
        fh=j7XWI4uup3Ux6h6GQxF4S6s/8u3BGcJPK5rn3/lagTM=;
        b=CTozShG0QJKALW+QsF6KErrwBy6u8j4Lq8NHq5ndlnsh87NZDGYy+k+0PsYbzbvv9E
         s3Uvp9/1znI0d93hoS6La31AFNKqxejlHubTbUxMOpnhQxfvqSx9mKScuf6Q/bSFN8BL
         rJ/OqFdqcAqtSQY2ovJCPgVPPzvhSNEpt8zt1Le+3TVBw1yVADV2tZhFx3iUQ9W5Xsj2
         49RaKR752hmjOTmE6ayBBx/3N8ocLH8cW4e9GzYaOSZrRcEPS9bqJXMJbu/mFzICY/4B
         CkWXd/bOnkDgi98bs8TwZaHTJ6SKA3j5SZQDOLQW0boVtTOUbbaSpq4cER+WzF1FfdhB
         xLFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791136365; x=1791741165; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hGuGLrOvm4LeUyfXJ5B4JaitM98XinzaQN/wjAvVcwQ=;
        b=fO8wObONtJGgMbCrMVsZhMWKoHREWNC5HVnpvOHgjlbtqYgn4VcOHc89Ll3rLoWRLg
         QgwuunBS4Ttu5mamlKf9SnNJUd8Omtq+GuI9SB+d5tlMQ10QXRF+vTmsoOJZ9kZrC7a4
         0QbJ8yB/W/Q65fgZNxqpnzrLuC7MojkkEF70dKFka2D0oJQ4PdFsyA7xbgK9aQ94z8IS
         2jgBAvYoVtLZpTOauQeRuPgtUk9J2zrEK4veyAtgMsng9+rRgw5TwFIHAWRBGmx1dm6F
         LuvsAh4cJHojbJ5N1k+MGCwC61G4bEiaMyxRXiC7wxmh6tt+efU9HDaSjh1NXEVDGGzU
         pWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791136365; x=1791741165;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hGuGLrOvm4LeUyfXJ5B4JaitM98XinzaQN/wjAvVcwQ=;
        b=iXWn79MFE3/OY0SZooobNWhX7o7M+XKqRMnboK6avumsI+vY0gjhxN9AMkiR4VTM5M
         I+7bEqihnRluqr+Oes8A1xi3yxZY/qeBdX6B5QS5sICiaicVY2RofPHC9UF0eIpsI67H
         CTB0RXpVd8iZq4IwE+0TqxG/0xflMvERNtCl2icmIv5iZc9gBTX/SqBpRLRM5zoAK/L/
         j+YJD04atQpFOMrholv1nAFUg2VrvQZYkP6wp96fbjSuIBjgBTQUdHb6TwqEqINnkRAY
         HorU1rJKLm8V2fNb2AShsfRDqWeAS0UNqzX60KojT7wnqzAS6e8tD0GcEfDI6UKlO5is
         OC6A==
X-Forwarded-Encrypted: i=1; AKwUvBwK3b0G/dyPzqCV3u575Km8qz+OjCSZuLqcK77DuYjR+pmHKPc244nT0paD5DNVLRXmGTGxI/hcNTI=@vger.kernel.org
X-Gm-Message-State: AFuF++kXS1EHFcGIba63oCIxD618AwqfwEAabzJ30iz8av8ztcWXUsOL
	N+dLePdEX/+1EoG1NTqypIwq5v0NZtmXhg4I4OxzK+0Q1+2kRRopDUE51z6MH/+B7F69NOwBrKe
	9FP2UVZlMgYOoFxZVS8UAUgi1D6vn5DgDlwxB1YLi
X-Gm-Gg: AYBFou3eMlBN1yCTZnFCN/7MD+5iggp9W1q9YK/wI+3HEQe4ZknlogOdv7Q17i3fLU2
	23ZiJ5ZtpGphD2HXagTSwJ+VMpAqSMvXCZR7YL0ttSp82GXA5JLZfQSQ9rr/F1PlsVilcMaPDft
	4SHbUnWwswcjmyvvDkb7T7lOAlUfQTAYajLCUJYxEXb8p9Hsq4kyhYj9Q7Vz8HCgLG4scB0GV9H
	mPmKdFQ4XoKDfWuIKHZy1MWCryh1rcNP7f6R2a1r3XffdLpB7bVFNgcTk4DPIAKO+usJ5RMRbvN
	g34u1WwdK6cFwQPmsvKSeobarzP5oNcSZnOcF3MlDAgn01uRJspGMA5EOw==
X-Received: by 2002:ac8:7fd1:0:b0:530:e00f:7768 with SMTP id
 d75a77b69052e-535143a7ee5mr16757211cf.0.1791136364655; Sun, 04 Oct 2026
 10:52:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-0-a1f052500fd7@kernel.org>
 <20261003-b4-mmap-prepare-vma-flag-sanify-v4-16-a1f052500fd7@kernel.org>
In-Reply-To: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-16-a1f052500fd7@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 4 Oct 2026 10:52:33 -0700
X-Gm-Features: AclHuK97kMRDYoB6lQW3TrcrLHtwyxFXHppfod8Uz1hqyRH7vKfp8a9EoRVxxRQ
Message-ID: <CAJuCfpHQwLZiXqsC2BsC6tUACJOMFfyLp9KC2w22NnzM5Ncrmg@mail.gmail.com>
Subject: Re: [PATCH v4 16/38] mm/vma: add and use vma_[flags]_is_fixed_mapping
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, 
	Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
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

On Sat, Oct 3, 2026 at 6:38=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.or=
g> wrote:
>
> This determines whether a VMA cannot be expanded or merged because what
> they mapped was determined to be a set size at mmap time.
>
> This typically refers to mappings not managed by core mm, however
> VMA_DONTEXPAND_BIT
> is not reliably set alongside VMA_PFNMAP_BIT or VMA_MIXEDMAP_BIT, so we
> must explicitly test for this for now.
>
> We also explicitly test for VMA_PFNMAP_BIT as VMA_DONTEXPAND_BIT may not =
be
> set for VMA_PFNMAP_BIT's despite the one implying the other.
>
> Use this predicate in vma_flags_can_merge() and in check_prep_vma() in th=
e
> mremap logic testing to see if mremap() can expand the VMA. The criteria
> for khugepaged and MADV_COLLAPSE eligibility in
> __thp_vma_allowable_orders() are precisely those for mergeability, so use
> vma_can_merge() there (with an expanded comment).
>
> This obviates the need for the VM_NO_KHUGEPAGED mask, so remove it.
>
> Hugetlb VMAs remain excluded from khugepaged as hugetlbfs always sets
> VMA_DONTEXPAND_BIT.
>
> Also update the userland VMA tests to reflect the change.
>
> No functional change intended.
>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>


> ---
>  include/linux/mm.h              | 39 +++++++++++++++++++++++++++++++++++=
----
>  mm/huge_memory.c                | 11 +++++++----
>  mm/mremap.c                     |  5 ++---
>  tools/testing/vma/include/dup.h | 16 +++++++++++++++-
>  4 files changed, 59 insertions(+), 12 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 83953757735a..6b5f06cd174a 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -600,9 +600,6 @@ enum {
>  #define VMA_REMAP_FLAGS mk_vma_flags(VMA_IO_BIT, VMA_PFNMAP_BIT,       \
>                                      VMA_DONTEXPAND_BIT, VMA_DONTDUMP_BIT=
)
>
> -/* This mask prevents VMA from being scanned with khugepaged */
> -#define VM_NO_KHUGEPAGED (VM_SPECIAL | VM_HUGETLB)
> -
>  /* This mask defines which mm->def_flags a process can inherit its paren=
t */
>  #define VM_INIT_DEF_MASK       VM_NOHUGEPAGE
>
> @@ -1647,6 +1644,40 @@ static inline bool vma_is_mm_managed(const struct =
vm_area_struct *vma)
>         return vma_flags_is_mm_managed(&vma->flags);
>  }
>
> +/**
> + * vma_flags_is_fixed_mapping() - Do the specified VMA flags indicate th=
at this
> + * is a fixed mapping that cannot be expanded or merged?
> + * @flags: The VMA flags to test.
> + *
> + * Fixed mappings are those whose size is set at the point of mmap (for
> + * instance, a mapping of a fixed range of memory established by a drive=
r),
> + * and thus cannot be expanded or merged.
> + *
> + * Returns: true if the flags indicate a fixed mapping.
> + */
> +static inline bool vma_flags_is_fixed_mapping(const vma_flags_t *flags)
> +{
> +       /*
> +        * VMA_PFNMAP_BIT should imply VMA_DONTEXPAND_BIT, but some calle=
rs set
> +        * only the former.
> +        */
> +       return vma_flags_test_any(flags, VMA_PFNMAP_BIT, VMA_DONTEXPAND_B=
IT);
> +}
> +
> +/**
> + * vma_is_fixed_mapping() - Is this VMA a fixed mapping that cannot be
> + * expanded or merged?
> + * @vma: The VMA to test.
> + *
> + * See vma_flags_is_fixed_mapping() for a description of this property.
> + *
> + * Returns: true if the VMA maps a fixed mapping.
> + */
> +static inline bool vma_is_fixed_mapping(const struct vm_area_struct *vma=
)
> +{
> +       return vma_flags_is_fixed_mapping(&vma->flags);
> +}
> +
>  /**
>   * vma_flags_can_merge() - Do the specified VMA flags permit the VMA to =
be
>   * merged with another?
> @@ -1668,7 +1699,7 @@ static inline bool vma_flags_can_merge(const vma_fl=
ags_t *flags)
>         if (!vma_flags_is_mm_managed(flags))
>                 return false;
>         /* VMA explicitly marked as being unmergeable. */
> -       if (vma_flags_test(flags, VMA_DONTEXPAND_BIT))
> +       if (vma_flags_is_fixed_mapping(flags))
>                 return false;
>
>         return true;
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 4cd917f77f3f..87e8bf8029ab 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -212,11 +212,14 @@ unsigned long __thp_vma_allowable_orders(struct vm_=
area_struct *vma,
>                 return in_pf ? orders : 0;
>
>         /*
> -        * khugepaged special VMA and hugetlb VMA.
> -        * Must be checked after dax since some dax mappings may have
> -        * VM_MIXEDMAP set.
> +        * khugepaged moves data from VMAs once collapsed, after they hav=
e been
> +        * faulted in, relying on refaulting for file-backed memory.
> +        *
> +        * Mappings not managed by core mm cannot be reliably reconstruct=
ed from
> +        * page faults, and fixed mappings (including hugetlb) may well b=
e
> +        * mm-managed - precisely the mappings which cannot be merged.
>          */
> -       if (!in_pf && !smaps && (vm_flags & VM_NO_KHUGEPAGED))
> +       if (!in_pf && !smaps && !vma_can_merge(vma))
>                 return 0;
>
>         /*
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 7c368440fafe..ed19b47c2caf 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -1788,8 +1788,7 @@ static int check_prep_vma(struct vma_remap_struct *=
vrm)
>                 return -EINVAL;
>         }
>
> -       if ((vrm->flags & MREMAP_DONTUNMAP) &&
> -           vma_test_any(vma, VMA_DONTEXPAND_BIT, VMA_PFNMAP_BIT))
> +       if ((vrm->flags & MREMAP_DONTUNMAP) && vma_is_fixed_mapping(vma))
>                 return -EINVAL;
>
>         /*
> @@ -1827,7 +1826,7 @@ static int check_prep_vma(struct vma_remap_struct *=
vrm)
>         if (pgoff + (new_len >> PAGE_SHIFT) < pgoff)
>                 return -EINVAL;
>
> -       if (vma_test_any(vma, VMA_DONTEXPAND_BIT, VMA_PFNMAP_BIT))
> +       if (vma_is_fixed_mapping(vma))
>                 return -EFAULT;
>
>         if (!mlock_future_ok(mm, vma_test(vma, VMA_LOCKED_BIT), vrm->delt=
a))
> diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/=
dup.h
> index 89c645a6ad60..442ea9eb098d 100644
> --- a/tools/testing/vma/include/dup.h
> +++ b/tools/testing/vma/include/dup.h
> @@ -1676,6 +1676,20 @@ static inline bool vma_is_mm_managed(const struct =
vm_area_struct *vma)
>         return vma_flags_is_mm_managed(&vma->flags);
>  }
>
> +static inline bool vma_flags_is_fixed_mapping(const vma_flags_t *flags)
> +{
> +       /*
> +        * VMA_PFNMAP_BIT should imply VMA_DONTEXPAND_BIT, but some calle=
rs set
> +        * only the former.
> +        */
> +       return vma_flags_test_any(flags, VMA_PFNMAP_BIT, VMA_DONTEXPAND_B=
IT);
> +}
> +
> +static inline bool vma_is_fixed_mapping(const struct vm_area_struct *vma=
)
> +{
> +       return vma_flags_is_fixed_mapping(&vma->flags);
> +}
> +
>  static inline bool vma_flags_can_merge(const vma_flags_t *flags)
>  {
>         /*
> @@ -1691,7 +1705,7 @@ static inline bool vma_flags_can_merge(const vma_fl=
ags_t *flags)
>         if (!vma_flags_is_mm_managed(flags))
>                 return false;
>         /* VMA explicitly marked as being unmergeable. */
> -       if (vma_flags_test(flags, VMA_DONTEXPAND_BIT))
> +       if (vma_flags_is_fixed_mapping(flags))
>                 return false;
>
>         return true;
>
> --
> 2.55.0
>
