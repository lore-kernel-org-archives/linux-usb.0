Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014BA49B1FB
	for <linux-usb@vger.kernel.org>; Mon, 14 Sep 2026 19:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789415867; cv=pass; b=mG5Wsh7JgDNEszDdGnmQXXtjoxB/Y3BhDtON8K61gir6e0bQrlSST0CYgE0MxV1leab3JEV7w0OvelXQuPNtHdVIL0/Ae1g3TlrsYnFhFsc9ALPUqXw81X0KHOyRKarMR9Tlu8Mkpfwn3ya2TCG5ywleHessfvGFxMsT4aIfehQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789415867; c=relaxed/simple;
	bh=rm+zdLu0LlzNfMP/vZrBYvi966p9ISS8d4XEb3JQ094=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hCI4CD4SO8Cx85Hp0sGrYCOEAnG7eH+CYVM/eD7+SvtVHHbOF/jmokU3pC5wrjkb0Rov3nvtg95WLOvZ/Bd0H9KP/l6QsUA9G+ExHHeAVlJ4hu6cQbNpnm7I3HfMqqaBu20vYdiflKalJVrJThjgKxnJk2Cs5R7C9eYKUQx4EpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=VBYIS+ru; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="VBYIS+ru"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-86b90133ae8so1980667b3a.1
        for <linux-usb@vger.kernel.org>; Mon, 14 Sep 2026 12:57:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789415862; cv=none;
        d=google.com; s=arc-20260327;
        b=QzMcreLVYpqPQShaoWQwT2VLhXXe2nJFMhS0Se66RUfsDpYu/Oh+FP4egrboPyViL9
         0onD5oTU3G5I3dXP/lbpt8BH1j3l8mt99BV0ji2PFjTvQG/i9G0IzAsDF05/MgIqwq/Q
         9Yu0dXEf6cWZpdwqRIoJWjx4GlKPNcxup4icmucoH8Cn0bhMPBFzdYXspjv/MPVkHOOl
         ClMQ0uHUbzBiPjD3sgzWY4K2njq2QS67SzrwTBkvMt9EHnF1IFRWglX5EiTe5SSatzxD
         4StMBVpK+j6AqKpufu+nOMniDRR6Hje0VHUAw1F4PQhqQh6VS2Lpr/JZ9Uw4OPTR2AoG
         jh3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iEa5EIpxI31VfZhRCWTdUVuFxMmPcLfnD5/j1cH2Le4=;
        fh=6I5HRe/YyZBEC2EMNH7cJ12BRj7mS7U0rdvGHnY3eWw=;
        b=GC0o/b+KJchOL3j0Ho1Y3VAzdU7eioZahIzcQ4dBllD3nHCctBWNO80Iu6cRzCo8uD
         qN8xC7Bym66qi1RsqbRiWWvZqEZRZ0+ikl8hC5D2Mj2cYyJGyPPrUtRMAW/YQa/VrUVK
         qXAzddyZ6Ha7gjxEF8BiKp+CG3l6FDYi1HWQ+tx7LhN+YFVwWVS5AALX9EqkeNNd5pQ0
         2VvCstj85UlncQA5FW7zzGCSLTWcm9VdztlLlGumLyHZlcyOJNV8eeSqJy4AGRj9NTdR
         BN4wjtsCdncww3Pm2RLh0MSCrS1f9qFTl4SMbv+n+A+9XgAEmZq0ruCQEALYJpBrnKjQ
         P6Iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1789415862; x=1790020662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iEa5EIpxI31VfZhRCWTdUVuFxMmPcLfnD5/j1cH2Le4=;
        b=VBYIS+ruvec/YQ7NPDSavrBqZkup3jtMUSf2x9fg2vR4Q/ZYGnptCqM7UF9GBEk6Kb
         pwYbAK2sJEZFDjRFht2ALhGnWfzEgxLd1W4Nqjf3iOyc3C9CQVwNzR9p52/m8eg00t3y
         i3INHp65zySvAJlrkN0SKQiamBOPK/2OeoXHbM/ieIzmZObIDK9PzOChSRrcM8YAyS56
         Wpk2JsgEsfietAppzsrHDi7c7Qi8vepD85wgaha++Drvrzfs42k7ryFVO4ohzIir1SFu
         Dz5Af79neP1/ODat12UTHwq79Ug1vrjKu97+aj6V0fudJlIrOVtfB5xkOELTreMhvqOw
         VVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789415862; x=1790020662;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iEa5EIpxI31VfZhRCWTdUVuFxMmPcLfnD5/j1cH2Le4=;
        b=pVPqvfzxUSudyB8Zu/sj2YMjC4XJuRlgZ6H4IOmcInAv/2HVAnDG4gFgnr3hvPIOKf
         nfrSsqvsXZezvidnX/NcaqTFm4bdpwboI7s6HduBvVR2vSGVEnWh3Jy9jZP5Jxkri+5j
         AQIa8oeCvnvotGT3uO4ipFppzxwt6NcYiLkI3osRcsaiMfIH+c2/imd+h9mb0C10R8Ao
         faa7VBn4ZAdOcI1KYF1qpRb4KX1ZTWRt3Vq87QCIX9Q8ag7Si9Q5be052XfyU/tgbom+
         /RljVo7/8IuOuDOHULI7li7SiCf2ExKOofLNJeWti25xXuK0OIzuYuIpqdZWD9aAOcFT
         L1lw==
X-Forwarded-Encrypted: i=1; AKwUvBylgxsDMnkj6GhhvMKzSP3Xt0wcbgyx/TJAw4LQT2q2lO/WWZ/E7+opcaFrtWnNMTH0/yJfFfgwHwM=@vger.kernel.org
X-Gm-Message-State: AFuF++mN4ATq0XHOgfOidSMb8matzqyLV66W2+N94BgVuNgDQNwop9Om
	ibkNyb3bvsJxXULP8oHzXt1uACPWF1jCUpWLl/srmCPitVlwSGxRUwLmP7t6bfldBjdcH5VXC6l
	jq+o2vXwqB3ZZsWfTRtEvNm6RQi+NscQYBmXiHCY5
X-Gm-Gg: AYBFou1YVLShPL/J6TvxBSsIjRpWOuHiB0uutfW9Vq6dCArvNdW39vVW4R3PmEn2rBB
	3O2l5r3X+V//5QmuaR/hz/Bya3IeLg9mEAaYz0mtLA37elKRIniPVyPTpq2u4SIJHuxj52qDoXC
	x7yI5HwiNFiQc/NeuGbB5/K2XBopByRJj0xRAmxDv61/NlZc9PrEG1YLaeuu8Ly0kJt9I8WYgGQ
	7fDmS8+Rzc+HS9Q36Wpg9EoKYRLUOUwQn2La9OaOTTpQTC0wYVlpdRXAH6bjTa1YB7vmAniZeVU
	c932+iz2riAYHdzl6jzNGxG0fobalQdMOfuCV2ToHPtiN330kZcYIlpbEvD3ygmH9ctB7UDoy8j
	e0wNO1pEdeDU=
X-Received: by 2002:a05:6a00:18a9:b0:858:b809:6ec0 with SMTP id
 d2e1a72fcca58-86f869a920dmr8896742b3a.23.1789415862342; Mon, 14 Sep 2026
 12:57:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-b4-mmap-prepare-vma-flag-sanify-v2-0-7d9781ed5361@kernel.org>
 <20260914-b4-mmap-prepare-vma-flag-sanify-v2-12-7d9781ed5361@kernel.org>
In-Reply-To: <20260914-b4-mmap-prepare-vma-flag-sanify-v2-12-7d9781ed5361@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 14 Sep 2026 15:57:29 -0400
X-Gm-Features: AcwNN1XaLRK0KaZAmfcRvdaBSkZOdh14LF1fb-xWULoFVhBfqyRklsdKoWBmLag
Message-ID: <CAHC9VhQ3TwdGGH6YtVyMqJX4avJwsadcRvRhAoUhCvJEHk=i=g@mail.gmail.com>
Subject: Re: [PATCH v2 12/40] selinux: reject writable opens of policy file,
 drop mmap shared/write check
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, 
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

On Mon, Sep 14, 2026 at 11:05=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@kernel.=
org> wrote:
>
> The policy file has no write method and is exposed read-only (S_IRUGO in
> selinux_files[]), yet sel_open_policy() performs no open mode check, so a
> CAP_DAC_OVERRIDE caller can open it O_RDWR. Reject FMODE_WRITE at open, a=
s
> kernfs does.
>
> The file can then never be mapped with FMODE_WRITE, so do_mmap() always
> clears VM_MAYWRITE and VM_SHARED for MAP_SHARED mappings and the VM_SHARE=
D
> check in sel_mmap_policy() cannot be reached. Remove it.
>
> This also stops sel_mmap_policy() clearing VM_MAYWRITE on a mapping that =
is
> neither a PFN map nor a mixed map, ahead of the core enforcing that only
> such mappings may do so.
>
> Acked-by: Stephen Smalley <stephen.smalley.work@gmail.com>
> Reviewed-by: Jann Horn <jannh@google.com>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  security/selinux/selinuxfs.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)

Acked-by: Paul Moore <paul@paul-moore.com>

--=20
paul-moore.com
