Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0882C47ACCE
	for <linux-usb@vger.kernel.org>; Sun,  4 Oct 2026 18:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791138265; cv=pass; b=AtFWYFbE5BUC0QgO2XkonYSni3RdxzdxqSCfl9XLuSc+WhLyJGkAZXj0PG4DJbhVP8PjSVvYzBGs8H0HDVEnJnqSoM9NCt+GWDXlyxhAthonzTTDCaVD9bciJ0+CDYVLzv0tqxuzBpyb2CAbtLjLtx7qHO/+laSe4sjwGwdyV2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791138265; c=relaxed/simple;
	bh=3aBRZG0J7nrNd8eWZI+tOUTLRCjKVPsGyHM+wAKTgfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hZGJt29VtRu3+IbZjx1g+Hi+h+4eAwv2uGhoiPYYLNNl1q6ZWhMJbYx9LNqpwE4JUTUvGh8Qz9xV5ji13lbR4bQ2FsY/4MM6T4sGqkq5y+xJK5yyY061xxEFEb3CAd0Y61NjlAM+d7WjITAZl5xf+cek4oUxOLXtfsdX9ktpKzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f8vk+6UF; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f8vk+6UF"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6aae147ef9dso7790a12.0
        for <linux-usb@vger.kernel.org>; Sun, 04 Oct 2026 11:24:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791138260; cv=none;
        d=google.com; s=arc-20260327;
        b=kwqroi8tWXXqqrviOtjiSA6nr6FHUp1tumtEwbp5X0uErbdsB28ee2sdY8WlBxBIjt
         +dQi46mYXxyNhYSSguISVrkctg5nPLt8nzJbj82GWa6DhcYeOX2k9PKYfVUNZu4y6ZVg
         O/g5ABQ1u3HCBmQglxRue3J9mwmBHtNYnleChSkDER8DEDDrF15LoEK9YwznOCGAMZ56
         UECxpqlnT0ciEz4CK39Zc6WK9UTE2yvaMl1d4f3MIjiereKJvswIN5pxIHwwVaJL9Dav
         OQcbUqQLc718V5azkFGKCfohS2PaTktia6jQ0KVGoVW819LKHDyVpWuGbwNQQrq23Bgd
         DZqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=COuPsBcUBk1eT8Q71dO8QdpqB3ZPgP0C77xCCCNJQiA=;
        fh=JPQ5tQ/9ZhGOdoa/onrwRFQpmCszM/fVMeI532E2waY=;
        b=ZauBidDsudfi8JPOqbcQFjZLgqv2cYFhIt/brPx/5P69oQBmlfjCN9NfUIxfHZ4eC5
         Fkd62mcA7k0QjFM+TOkWWL6/slro6y8CjwT4lOZjTRfWZ2h5Ou1DkIDnR/SpwzVBJ5Hb
         6Q1vNi9i45Chhmb3enxSTIwMdblU6vaksIBQqcelkGqLJdtHfQ8zpUE8ml0WLeIglIZP
         GKK31NuQyV2Pdog4ODCMZCPNxkGeZ39fZqTmke6tmfM8tV11+CNOyv9Rtyb9rUG++IHZ
         bz1EDqhAMsnuijqWyl3qYC5iE0IVf54MgUZzG1ayoaS5eLXFVJsZtv7QuNvB54wTCkKa
         tpNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791138260; x=1791743060; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=COuPsBcUBk1eT8Q71dO8QdpqB3ZPgP0C77xCCCNJQiA=;
        b=f8vk+6UFWZB9hoCvStnFL044+6aRT6xa5kAVBI9KkzKS7tGKQiXqW/AGoPYjSNmpfV
         5V3att+4ZDHkm96mXkBBSDYm5zWIFpFJiQaCEfS2PL2ujDeWJw6EpyGCPiuHOKpFXRPb
         Iurm+B2ECPgliexc3YIHy3Q02ZY8qxdRaOHTKxr+txvSie6zOeAqHIOx20yT212hGHNZ
         8utbadwdgS+CLQNTLwD3KgZM6udmJEuCzk/IeUiu9nSTi6gLPJsUTIlzpfsm8DDXCVUC
         fO7ppbKh9USxfk3Qu3KoZ2jgZFDjXTule4hZXiSgHMu9EwKm6oJG35ATUrk0WK8+xyVi
         CrSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791138260; x=1791743060;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=COuPsBcUBk1eT8Q71dO8QdpqB3ZPgP0C77xCCCNJQiA=;
        b=rWr8NuCmqJvucH4LtMZLHf5+JIYxb53wPZXoB8KTYDWy+nQn6Bq1tZFOje2RocEbsk
         86BuA9uiMZ+Q/sxkBegjEm3INuHXXHHS+Gebd8PCA5zy2J5SJQb5tmfR4fILZ9wMKo4Z
         cglqKWuOhxN8Ly/Kq8jKyb953GJjlEVcWAX4fNXzKLGFpFG9Lw7lwhz9CxUXjMWCyln3
         Ob6Z2L/dDKBIP7QgB0gngUTgcJeZZ9+XVaeTeG+pR9+P+TX4WJTU1mG2aB3CuKPEHXpn
         VZQ4D/D1MtI1yzCHHUvwYbfDtBU2DKZigNLt4wNnWvTkV+I7caS4d/yOsBOD4ODwTK7k
         rJ7w==
X-Forwarded-Encrypted: i=1; AKwUvBxe6WNhh0rSObDlgx62BegQKplaw2R/mTRsKGqHYvLBGAPUUVUuLgrydB8dhjbT6jxg48KjB8vdyQQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNATRAg8PVXWmaxuxnUhEHJE8pCBljmDcpXXu0O36vKB2f/Y7R
	yOWV2tFGfvK+74zrqMD3InzLjh3jaCNdWwZgeXCmO5rOnMpl7apLAcCLDqCZ0TrgJqGIvH0rscd
	vVeeHwFfXe23r/qC8TG6wgxuufWbCuZVgDjxNEu+H
X-Gm-Gg: AYBFou1GO7hqEvhyrw3F5mtFEWL5Btovvhia1oJ5CYztXyp1lgNqPigEdOoGpPxH2bq
	tq4VP25XbJnvdvqMP3p4RwSL8ffPmZfCeo8nRiX6zV5M8/7fBkteUlHlsnQsIJUN+n9X1Su4w3l
	ahFSLM2ZM319rqCptqZElHsxxI+FiovHkutkbf7vp7Tu87vWN8IRtyLG1cZvuJLaSk4bH471S12
	V3k1LLFjOaZCZTgpFnTFX0WVYVX6Ph+AdfMYIM8m5nMleDcBHM3OJQgB43ski0ksedR4HRhHKkA
	o0WWolpTZofQ4ZVsj1hntnnLHsYW9fw8/xGcsWQl+QJEHSz5833ZtrwQTwunjrhlaoE=
X-Received: by 2002:a05:6402:a2cb:10b0:6af:7a5a:97e4 with SMTP id
 4fb4d7f45d1cf-6afaf6bf03amr34523a12.12.1791138257648; Sun, 04 Oct 2026
 11:24:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-0-a1f052500fd7@kernel.org>
 <20261003-b4-mmap-prepare-vma-flag-sanify-v4-20-a1f052500fd7@kernel.org>
In-Reply-To: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-20-a1f052500fd7@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 4 Oct 2026 11:24:03 -0700
X-Gm-Features: AclHuK9H1gPgFkK4n-5s4Gd8NQjwfuvbGlNRYoPrM6gC5ICSAC1H3Sf5qTdT1bA
Message-ID: <CAJuCfpHOo8UhAZMvO5A3dKbqxQGAWtKGMHXJ+Fc=qwH=Nm0b6w@mail.gmail.com>
Subject: Re: [PATCH v4 20/38] mm/gup: error out early on !VMA_MAYREAD_BIT VMAs
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

On Sat, Oct 3, 2026 at 6:40=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.or=
g> wrote:
>
> When populating a VMA range via the aptly named populate_vma_page_range()
> an unreadable VMA will always eventually fail with -EFAULT.
>
> That a VMA is accessible is always checked, however VMA_MAYREAD_BIT is no=
t.
>
> All user mappings always have VMA_MAYREAD_BIT set, so this check only
> impacts kernel mappings.
>
> It is implemented specifically to disallow population of uprobes XOL
> mappings which are exec-only.
>
> A nasty interaction with these mappings may occur if they are mlocked, so
> actively disallow this early.
>
> This allows a subsequent commit to remove the VM_IO check in
> __mm_populate() which otherwise requires non-MMIO mappings to be wrongly
> flagged simply as a workaround.
>
> Acked-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>


> ---
>  mm/gup.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/mm/gup.c b/mm/gup.c
> index c2dfcb4744bc..e6310a7cc05b 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -1836,6 +1836,10 @@ long populate_vma_page_range(struct vm_area_struct=
 *vma,
>         if (!vma_is_accessible(vma))
>                 return -EFAULT;
>
> +       /* Unreadable VMAs also cannot be faulted in. */
> +       if (!vma_test(vma, VMA_MAYREAD_BIT))
> +               return -EFAULT;
> +
>         gup_flags =3D FOLL_TOUCH;
>         /*
>          * We want to touch writable mappings with a write fault in order
>
> --
> 2.55.0
>
