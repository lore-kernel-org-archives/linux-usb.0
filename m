Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA67471D02
	for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 09:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117799; cv=pass; b=E/flBQ8pEtuRshGnmb+O5/I6Yf8orp7Ft0pUqnMEKex/zTC9PQ9j2KFivf4LUC0XcA8Ke+8rEgA2c9rwkoppPObZesui1CXfFYfx15NP9tqmzAyr9whyr9LFUWf1OHGBfNK/b7/lqeXIlgf77z7gn8wcFWVA6+qlqJIl0Dgg2Z8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117799; c=relaxed/simple;
	bh=DqoU+uWaz7+Vutomy33tnRZ5BBkjj/lsKZ4FCxPriAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nNNkikQS0u4lBTDYG0BsOAPnPNDW4N3xmNNcATCveI/OC+ZQ9xLRKtmr61SlBU7cvtBbOGLHLfGJPRHp5GHk5ZkF44KRSyImyJqxZw6WIrWZ3Q67IJyQM0JzCxLGGo2zJHuKEE4w3UGi1KLZOKbsVGRaM/ciocf4YqTyF10t2/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MSlPe9Et; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MSlPe9Et"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47de0093c42so599191f8f.3
        for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 02:09:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789117793; cv=none;
        d=google.com; s=arc-20260327;
        b=EJP0MLWDHwq3aMQyHKybKcXxohX3TWpAkz6XfVd+4K7l2WYsYyM1HKGx36fo5QhPGX
         3ZHEFxFpMW9A7OcgHIz7iIto3uCW9NfRr/CaZxcJmKVDFadSLyVZ2ar5oRjTCu5Y8MOF
         tcjTG18oTc1XiPBQmmDn9d/fFj2WJlaiGjOH5KqNSs+AK1VabLk/dr2aHWqAHsDr6cKQ
         3MkkhKWoFGq/kqx6Z1vINkWqssmMlhbYo+NIDPM8Ft/K5RDbrM2D3RSrQQa7ahqmq5gZ
         YGF/GIdvmJkST+hN4stO+xWtSUJanULL7WLcr+1y4/n8SDtbRPDqZGf1wVVXhSp76bbS
         veNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DqoU+uWaz7+Vutomy33tnRZ5BBkjj/lsKZ4FCxPriAw=;
        fh=8DCosdzABeR7yenRJtYroWMgfl04mNE681tdb4k2Q1g=;
        b=cDccxcFDk9jGmkihZ+ZSvJaW9N1qZRttX7eyf9f6RW+oSVyvR5KrtyE9W8sTZh1dju
         w6mqNraI9orIFXaq3abVrcpAnvsoV0p0w+gtqTti2hbFpYUmzMksevs0uIKCp+ECIEVR
         dxLXvjBDCnWAPhE0G2O+pxWqfFMxOARQtyvRW8+So3EfMPKwtuAyOLFFj5/NT9TJhw2R
         jtcMmPXrhJ8c9FKoowHSJbt+28ymlcXlJfpO6Cen+iqk5ce3XQS1vWtMDqGzf8vtwu0J
         ZR/kn4yVYlBhDd7+n6MPpWukvzU89mG6BKtcMdSNpyk5+Pp+C33JgHyuT43bnEot/Fal
         w71Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789117793; x=1789722593; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DqoU+uWaz7+Vutomy33tnRZ5BBkjj/lsKZ4FCxPriAw=;
        b=MSlPe9Et/aYooxs+mmr25pr80uFZG23i1Ff+HYNwoUYblRVkid0l2inKFKvyYhCHpA
         74RMEIvUI+LYnoLKLKfOmV3XsO+idJkaF0kKg+yth0rRQtl5E2y2iqZ2+BzrV44esGe9
         Gfqu0/0FtTeTt/gj1nMdkeGllp4GG8/dPMW6SAduAajB2PJTTh0EyTtISUFtDK6olxs/
         iuCpPN7ycYnpIx1qtI10WS4KO12IM90KAskYtoHYQeaRXYEsRQKGp3BGi7i/JLvOBusZ
         K3RJXi816wGUGyT/m2NeekI8C+6tI9P5dFmWFfKhpigFYWlsVGwnGy/m0LuueQHmrlvX
         Kr3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789117793; x=1789722593;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DqoU+uWaz7+Vutomy33tnRZ5BBkjj/lsKZ4FCxPriAw=;
        b=cUygIOGPjVnnpszVunxVl0hkccKL8P+tcXYnKWXwTHIT8CBE02hQvukk/4ahD7pjEC
         9VNLhyinsbZDQOMb2uv1iOOdKZ+s9QpPMAQgeNuNIgFGiCSUDYwzbodgx4+JFmOtx/oK
         4+lAq+v3adYaSJR5OsNja9pi+V6n/gIaAAy56G/YsNdVBNwUK9M9Z3wOLgP8ybkpIcE4
         CVmn/OaPpS3opXrZ+fbDpLlsTwiyya3jvrXVCVRsJOLwg55F0eB3Vkm9DWr8EHohK1Xj
         zibQ+zZHThbyGeINnsk94SzGlEJfeIQgU3D3mRt6T+wMDeMwXgQoArp0uYkcNwxJac+Q
         VMNg==
X-Forwarded-Encrypted: i=1; AKwUvBzCQZYolkzHCf0gFDGYlUwFXjbYzUa0pJ9tUChRrBHVadrVrVK13lylHpoUL0hiBM3xy8y7FON+iOE=@vger.kernel.org
X-Gm-Message-State: AFuF++lSUA8KSa3/Pz5heFHAaqVppPppjkI3E4R11LrF66Qxvp1J7GFP
	pXkVFxFE4VqDhtASSKJwWZCTfKlTIRBtt6BffVzpBpYRdsaeMXsjN07R/zmTKrQGm2uF4L5OaJS
	JTOH1dLH/2F7tBcv4e1ONfecc5Z0hab1qTp5wfbLA
X-Gm-Gg: AYBFou2fusQXrZv5C/yH8Hb4T2w5SxIW6bspgcfK+RCq2jEUH9JaiEi3+IJjEgdAKU5
	DOp8H5fDx4hbaD5i6vv5ohjO0bpsktHjoKUpgTcUpK8Jk9c9ymarZDksKwqgbiawSSw0+BfTntg
	UEnZZXgSBY0Cpm6iFCUZ3C94OUVhniitb4tqSQ9TXOhogCZDyl+/G+s5Cx2MNutUQyk7Jtqlxk0
	wH81MAq8KaPSuRnDaulV0ZxYRNQVYkIBX+RTdKEHy6ue+iYUfiWNLr3g+tCYfUFSXVC9VDLFcea
	9694ShMP8okG7giwdhh73a50c5mT+zpxmO7V4JubDU92Fl9mrC5zLPFbNWiQbIxPL6e2Kg6ydJH
	v404qE8mdz+MZdt1YsMqBM7klWhtXGmmwH5OOIrqVMQWiTmT5+nTa
X-Received: by 2002:a05:6000:118b:b0:485:8c16:5ef0 with SMTP id
 ffacd0b85a97d-486eb2fe6e9mr2544735f8f.42.1789117791504; Fri, 11 Sep 2026
 02:09:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-unique-ref-v21-0-e83257373062@kernel.org> <20260910-unique-ref-v21-5-e83257373062@kernel.org>
In-Reply-To: <20260910-unique-ref-v21-5-e83257373062@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 11 Sep 2026 11:09:37 +0200
X-Gm-Features: AcwNN1U8uQc4Zj212gVRashrRro-WErwh8uVMQ_MWKQsPaL29993fZfZR2Hn4U8
Message-ID: <CAH5fLggBGvXayMT2QGo5JeQkYeJYc0L-348-kKLsBs_g45-fnQ@mail.gmail.com>
Subject: Re: [PATCH v21 5/9] rust: Add missing SAFETY documentation for `ARef` example
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lyude Paul <lyude@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Igor Korotin <igor.korotin@linux.dev>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Ira Weiny <iweiny@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, driver-core@lists.linux.dev, 
	linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-usb@vger.kernel.org, 
	Oliver Mangold <oliver.mangold@pm.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 11:02=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> From: Oliver Mangold <oliver.mangold@pm.me>
>
> SAFETY comment in rustdoc example was just 'TODO'. Fixed.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/351
> Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Assisted-by: LLM
> Co-developed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
