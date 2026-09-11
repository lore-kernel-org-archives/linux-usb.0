Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74B530ACF2
	for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 13:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789134213; cv=pass; b=Q8pLqnG0qEm6k7abt+tQrCjJIpqHByYkq+2IhIy0k5N5bYC5SMdqnlvUYdnwg454TcFimd7qmdO1dx4SB79AiOZkLbMJyaeBgGDCfYL5ILowID/s7qgk/0ID7r/1y3hzBgV9zjQ6+C5xtOt8bFatKU5g0UWxrZ+cLAqnklIK9y4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789134213; c=relaxed/simple;
	bh=qqONGiVmU3Y+JSEn4qygivSbxUuzyWx0IT02Btj63eI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iTKzp99AJBvLVC5U3WuPWhm9K27gfT4+rwSM7lSrJdwc/11vToIc+44MfOfopEgmtHhYfoPQW9mR5r37rMze4P9u1tGe7a78QYe9Be0DaK2PD5guPgyMIcxj9EyzI1oZ3ayNJFIr6imgBhOSoNWhhkloz2p0DYj8uF45v1VxtK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ehf9dS9K; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ehf9dS9K"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49e63568bfbso6211825e9.2
        for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 06:43:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789134210; cv=none;
        d=google.com; s=arc-20260327;
        b=bbFbLQ4LQucdbMrioS8Ooi9nixzwQFJlaXp2RN36jhyfRSaD6MO7aj/+NSfpCxXsj8
         21Eee3Y0InjQA6b16PYDhhvU6e9bMCnmCuoJTE1EnsOR8JyUfNvoVnBeJOnSpIbBvPj6
         dJOzMHFQGy84//SY8zXvjhKLhGZc9pAnLDrLErQ4H8t4hN2Va8QvMydeek7kS2317lIx
         s9k6bRSLCtOnhK/9y1oVlKjx34Is0GJu8p44aqyWE1jAGTcH1FlcOUYmeA+r7Ijsh7hW
         vyjIrP3FYimJIsvVPxFlV017grbPqYyEqYH/j7WrFFFb6qqMKW/ibYLCAET2F+Trb+s3
         Roiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qqONGiVmU3Y+JSEn4qygivSbxUuzyWx0IT02Btj63eI=;
        fh=hbOQ0WNU+f2nb/gXLhZ7d/Q7HYfavCsgnldTCUbStR8=;
        b=qnUv28Y9rEdQ6NaDCTD1ShpZDMDanaRSehLEdyGy5H2z7sxeVxbO0aWLkvFZ+MwbVQ
         rAERDy6lwd9+xM0nwRG8uv8H35vRa+2OER5JYRF6AIJC+0ax8iMVFepb03N5DqssE/Dh
         8jBEjDYl8tkAYcdSDq3lNmTUaiKPXrdW/FHDRH77Y9j1juR6Wu+NT1rqSA2LUq+A3UxH
         TXCr4VRziYL6aaRTMq/ajltaj5t2NlKkBoBTaZ4NGqD8phKwac8FGRvYxBF+FNYZACzE
         AKHVPJDomnUwbGDgKkmlS0iMWjBgVwtGZPksGCmndKjXFHosuQfKY0RHm1dt++9X/oeb
         deww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789134210; x=1789739010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qqONGiVmU3Y+JSEn4qygivSbxUuzyWx0IT02Btj63eI=;
        b=ehf9dS9KBtz8dLPV1eOtxc8kmJv+fOyIVW2ZdO06596kBMMRx/tyUK2lDgVQgI5M/c
         SSpBMb7uUs4G1u34797nfCD7P+9zLvxXZxAHnuR56Buv7tbMHFhU+KXC31bwb8LxfuHW
         8rSFo0UCiOxET6/EGYFoQmdn13E7BSnpGDUmtBh5eTd4sQzXsa+4KMiX2L2pwFInQmBd
         XbtYZ8PflSCvO08pB5VAXZaYQ3wTj5HZ2Hp+yRGmtaYxRkpKM8QUHwvM09P+tJQDQK9v
         QG0xK00MrU/0875Gy+xMQiBhNe3qdsPJOLSKMbDDhT7ODGKOfLVFvcBzJ0WilrEwQq0E
         IdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789134210; x=1789739010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qqONGiVmU3Y+JSEn4qygivSbxUuzyWx0IT02Btj63eI=;
        b=Y0qfuP2T9QVysutatXnC++h1uJdiaqDPNWxWEiWz5sESq4dYvo9scpOK3oDf9y/QJG
         zqtGxh/FBDTmrNsKpaZErUJKdR5BbF+LtatX5i42xXFdD6r+y/4EPonguIegDWp4A2kq
         0m40m01iqQvTYijr8qhampZ/ApOq8agCX5/C/Iu0WWLcT56IggE//Usq77InkiHhzoZE
         dn9N6w6JALqIubydXYduv6O44fhsRSAyypq9M7uf8vXBhdA7CAL2a7E4RhasbzeIK1yo
         hhfm8QzYLPfk1eSeT6gjPjnZN7HlHjgq6uvHnyQj2YHzH9jfFwQfmkNFDDrp+RWfgjdN
         lKTg==
X-Forwarded-Encrypted: i=1; AKwUvBzXQ/Wk92k5PyXWT0D0eTy+kBaO4vURA620XoEDlK0LjsJwCe6yiPgugryH0CURFEiaoS7HCytnUnk=@vger.kernel.org
X-Gm-Message-State: AFuF++mExHgaqI/L4dh+l6rUU2LuLDArsyLqpIluPVkmiGpg4G40OE0A
	B9BTxkK3DITuS0VRH+LtjNsEUglogEtLqylk0nTv4Q/1korcXgo0Z0FaOkmnFDUA0guVMloWe9S
	sDzlap2ppxeVQC0X8cVjCaEN5cJVwVBB78PvL/qdO
X-Gm-Gg: AYBFou1p91KYcvO13gIf9IuO7fpJLvzWHGqaT8HcstMlmmv4zeY+CILlkzTeDhWcCbh
	lb86hQGjBJ8WJ7YNnWEwmtIXMhiuDttFNeWs8P35tqn+0qihOocUInca3NCIT7jj6toQ4RObOhX
	KCEmEk4j88XSZjCZl5ZSjl57exumoyy8WuT8tsPrXvsm381xTLN00Ka24sNbuQI1fIMB4amUkwj
	rVN4X902vHFvyTcwTP9kbGAs9WjIsTuhIbeoKIVU5wXjssvwPpk2Co3nUnrlTSBqlx7t7DRyx4x
	CKLvOoiZJrpVnIl0uxIDbAMLvmEh7AjLlgnyvLEcXMo9awOp9CgRSlxg2KKJOSTdcH+rzOUxGw0
	VCId9WAzs6DMQKtUhc4+DSRM5eU+q2RrWwFQRjufEV0FqWJY6Tg/4
X-Received: by 2002:a05:600d:8445:10b0:49c:cf18:494e with SMTP id
 5b1f17b1804b1-49e6198a3b2mr36939915e9.12.1789134209249; Fri, 11 Sep 2026
 06:43:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-unique-ref-v21-0-e83257373062@kernel.org> <20260910-unique-ref-v21-7-e83257373062@kernel.org>
In-Reply-To: <20260910-unique-ref-v21-7-e83257373062@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 11 Sep 2026 15:43:16 +0200
X-Gm-Features: AcwNN1UlYe5vy_4Ph8n7W5xph6nzuuUOW4o-tvYKznIiNAx0UgbfO_rFNfVUhuY
Message-ID: <CAH5fLghC2qRh8qNmMHMWQXiWW9FAPdd-O4z-O-17FFDB3hy=+A@mail.gmail.com>
Subject: Re: [PATCH v21 7/9] rust: page: convert to `AlwaysRefCounted`
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
	linux-pwm@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 11:01=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> `struct page` is managed by a native reference count, and kernel C
> code routinely takes its own references to pages, for example when a
> page is inserted into a VMA with `vm_insert_page()`.
>
> Thus, implement `RefCounted` for `Page`, backed by `get_page()` and
> `put_page()`, mark it `AlwaysRefCounted`, and return `ARef<Page>` from
> `Page::alloc_page()`. The page is freed when the last reference to it is
> dropped; for the order-0 pages allocated here, this is equivalent to
> `__free_pages()`.
>
> This also allows `Page` references to be returned as borrowed
> references without owning the `struct page`. Remove `BorrowedPage`
> and update users to use `&Page` and `ARef<Page>`.
>
> Assisted-by: LLM
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
