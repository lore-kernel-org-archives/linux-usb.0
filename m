Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182494FC8D9
	for <linux-usb@vger.kernel.org>; Tue,  8 Sep 2026 09:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859140; cv=pass; b=fGlyL20VzdEOyVVc5cnefWdmnrOyMwI9zEcI6xsJXCz6p2xzYEAjrBn221jd5MV68XGs2nLqlIC9nqsvhtU35IrC0fATLBoF1VaaQ6iWPzTJ3V66P2+GOc+Ki5aOQk+POI84YeuLl3iYkILPTuOOnabIzEyq3cn86ZNdHOpSP2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859140; c=relaxed/simple;
	bh=eXO7Dx+pbjhDr44qla+xgyZaF085tCxcRrffYGenIAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=glZB2Cm1JRPC+7hJWYamI+wxdloaO9+Dc6pxXXUvfXPskceyLwS8VZovBZxrduEro/ZIl1PvDfdWWmnS2qJp3M398svkHcF/wxYBxjEdpTNLnevoSmv+Z26kl90k6CFAt4Jp9iEGj642Cc0iks3Qw7YUn5zho6Wgd3QdMlB67gM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aF2kvHoX; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aF2kvHoX"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-482f9309813so4013684f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 08 Sep 2026 02:18:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788859134; cv=none;
        d=google.com; s=arc-20260327;
        b=SihR4ClxO2zwxQz7vHOFP7Nnv0PHMuA/JJqVn495j2NUydOyzOaTQvkaCJjq0bA+je
         g5C46IXTqs0ZLglCnRtkqPxXVR0MeePuZy/eKHdF/2FhQZkb88uF+4Ys/LhRs/Rsn1SX
         AB/KAH7quRnlBIMC6/Kw/5sYGjAyV56s85CUSbtaQBaQXBCZsRRNr6pJvARuXhDQue5o
         Wc2fHVhzIYPvIBLlbCNPw71q/cJ6u2XFc6Ob0Q31bJVL3Q/747udYBOSwC3DXbTNmmgf
         JtzQqcF+iu7xqenS4EbPo33t7S/S6eXvU8q/ZSi+YePMi8DbLRIBHW84JiMpy08a5w+u
         POEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VIgSHXB8I26MCbzgx5LIxLwOOEsEsffKtC5qMFw/5wM=;
        fh=A9N0zQrQ/Y5TMjH0LKdvj6gyti1IXO1NPpzchPDnE9Y=;
        b=pJ9knt/+GO9O6hZQ9lLMiMkBd18qXc/kxEqk0vhNd0rRFQA2pZJA2+t8J95YP6s1Ss
         Oc/0h46htYRcJck16CbTw0+N9xd1b7LyPZuF4PXzHEP3EMjbWQiSRLKCIMtgSOluPzYF
         lAXHNP1IFFyISxWMJufDPtx44Do9TPTBhxSpxMjoQYo3qp6fm6ob2TdS1vdnyPFMMVLY
         O4f1EGtQ6ykBemylAkUxokGlwJEkSonQucDZTTLnIL/wTpun88B2uoAuRNJbjA9NXxdX
         028kShVIjKNLlhlI1WzzuMUHKX0ic+Bd9dIWNkjiBfuOJUO4POmRGXILj6/bJAN6N3gn
         YKrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788859134; x=1789463934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VIgSHXB8I26MCbzgx5LIxLwOOEsEsffKtC5qMFw/5wM=;
        b=aF2kvHoXQnc3y94j3MpvsaBZICi9rb7EgUVMffOdRTqJRP1zI0ZUrzpkHxbK7TKccP
         URA7NthNEhjbDpvO5E5SfFkXe8lRprntfGsj6nc9Uj0+yhenHtGbPammp2p5QTTPzonM
         NNXnjqAp3WJwS07aLIioGpVpAn58cCI7zU4VyygV6BZ/hZx4mJ9gQmVOOut0nIWBt2Wb
         xPcr2pjuNWPhs94sKnzi7SboLd4mcQyEJwLgimh4PhCdgs+NIu36N1d6RQWevSO1lHXY
         3YOUzr+4enTI/l8GgUzMWZ467P2mHTPQIQA+3WkuXjBaAoWvG8ewZrnjIWRpQ1ssUF0h
         B94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859134; x=1789463934;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VIgSHXB8I26MCbzgx5LIxLwOOEsEsffKtC5qMFw/5wM=;
        b=WJ19JU9BgIpNb4kHgr44YQAV+59UueQvLS9ILf/dVKykrFMaQeLg3OulqkRcOv+qHH
         kLu6XbwhybKboa5cc8eIznMLSKFvT/jDlq0JcYjPOf4XkA5i2Nixv5K1y3W6uhb5SDJl
         l0aCm6E5qDRgMdXaI12FQ29l0mNrnsch9S29c+VOmLQ50/ekgTzfgb3eTXga+RjG7uGk
         bfjBbmWYAWWulJHSetkvKXIJn0wwyAaacTH9BL8uTLrsTe+T52YWJyat3fXHooP4vkuo
         32y5sLX2lOYZf0IA3iJSEJzhk045G6XKudRCW3MlMGrk1pAuibHzoMqoJJ8e7i2m1+ew
         Qq6w==
X-Forwarded-Encrypted: i=1; AKwUvBw5NYPPPn/cFDelZr+FfTEw0Huv5hGFALYqvOu7qHIbq3II1k8kMWs0eruW2X/gI0qkynAcXHHN3f4=@vger.kernel.org
X-Gm-Message-State: AFuF++kbYh80UO5Bc5x7rV2qKKHL0uuh5Wv11Wnj8R2U64mlFZd2y8f0
	8S3Ga6FbA2YswRldskfTrLCrOeOI5JdkAYsgivDQxsFoOhTUQzyS+HAR0/gYYFkjvzuAF7T97sJ
	7j8AK217riHgDetpv2e7orm96SIdO4O7Vy25nAstD
X-Gm-Gg: AYBFou1HWcyYG43flEaHiYGV2WdhzgPlc0n+Kkobw0vacvQljXxk9jFL7akMPK7dT2N
	RvcCD2IX39yKByOX5qExHaBfcqfQF33tx8Vbltvw1D8y/bbbjfhOnweURgry2oFoOR55bRW+YWH
	H2Ad6yn3pVMCk3W3tJqaWIEmxm3XwbDDxoGbBmCIFGKm3druK7w+0shToewDwnO2ZxdSelUJY/a
	lLKWw8yIeHIyAUdtoctP5VivLt/kj3+5vmIiWakSxUVF3fSpYG+Sy7j/7DX7nihymUeeLoqcgLr
	uMRcqadrsh5CiDGxkR58Vhxyy9BXZbOnAsVPfAbD1GLgS2OoB+HqEgOSaV6OzB+xQOSHED4vSRH
	EoUnle3b++oYJoovskSdvmAHz0s3Zng==
X-Received: by 2002:a05:6000:2584:b0:485:8c16:5efa with SMTP id
 ffacd0b85a97d-4858c16617emr27731999f8f.52.1788859132844; Tue, 08 Sep 2026
 02:18:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824-unique-ref-v20-0-490735672187@kernel.org>
 <20260824-unique-ref-v20-4-490735672187@kernel.org> <ao2WubjLtDuHvRzx@google.com>
 <DL894TFXM5AT.2QOXN683UKXIF@garyguo.net> <CAH5fLggAMfBcxprKJxs4JbieKadC_mKg4B0xNETOH1QUi72UGQ@mail.gmail.com>
 <8733vlxmm8.fsf@t14s.mail-host-address-is-not-set> <2dpwVpJS3VbfQ7CmE3HeY4IJSSMXTP_O9sSP3HHHUD7Z29RNEG4Hc0m8f94jKWjFlekcTXvIBA-QdGYrf8w1sw==@protonmail.internalid>
 <CAH5fLgjEfZO9DwcUxaKCWd_hFUrXU+cxiwmRg1UnM2pKD6gPvg@mail.gmail.com>
 <87zextw4c4.fsf@t14s.mail-host-address-is-not-set> <CAH5fLgjYmvp1Ph3dYXnTKkAvWgNpgCAPeq_7PZhRai6pCNmVmw@mail.gmail.com>
 <87qzj4w2nw.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87qzj4w2nw.fsf@t14s.mail-host-address-is-not-set>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 8 Sep 2026 11:18:40 +0200
X-Gm-Features: AcwNN1VPjOtQdlrm_QvCyA8uta8erft96HkhfUzl1dJDcrSqVwPtKidMELQvEqo
Message-ID: <CAH5fLgjrQDWSPX-81TNdnc=AU3Jge57vUJ_SHCn8=uUyGfRq=g@mail.gmail.com>
Subject: Re: [PATCH v20 4/8] rust: page: convert to `Ownable`'
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
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
	Ira Weiny <iweiny@kernel.org>, Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, driver-core@lists.linux.dev, 
	linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-usb@vger.kernel.org, 
	Asahi Lina <lina+kernel@asahilina.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 11:00=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Alice Ryhl <aliceryhl@google.com> writes:
>
> > On Mon, Sep 7, 2026 at 3:58=E2=80=AFPM Andreas Hindborg <a.hindborg@ker=
nel.org> wrote:
> >>
> >> "Alice Ryhl" <aliceryhl@google.com> writes:
> >>
> >> > On Mon, Sep 7, 2026 at 2:38=E2=80=AFPM Andreas Hindborg <a.hindborg@=
kernel.org> wrote:
> >> >>
> >> >> Alice Ryhl <aliceryhl@google.com> writes:
> >> >>
> >> >> > On Sun, Sep 6, 2026 at 3:02=E2=80=AFPM Gary Guo <gary@garyguo.net=
> wrote:
> >> >> >>
> >> >> >> On Tue Aug 25, 2026 at 2:20 PM BST, Alice Ryhl wrote:
> >> >> >> > On Mon, Aug 24, 2026 at 01:17:56PM +0200, Andreas Hindborg wro=
te:
> >> >> >> >> +        // SAFETY: We just successfully allocated a page, so=
 we now have ownership of the newly
> >> >> >> >> +        // allocated page. We transfer that ownership to the=
 new `Owned<Page>` object.
> >> >> >> >> +        // Since `Page` is transparent, we can cast the poin=
ter directly.
> >> >> >> >> +        Ok(unsafe { Owned::from_raw(page.cast()) })
> >> >> >> >
> >> >> >> > This doesn't satisfy the safety requirements of Owned::from_ra=
w()
> >> >> >> > because the page may be used with vm_insert_page(), which incr=
ements its
> >> >> >> > refcount and causes it to be shared the vma system, and this o=
ccurs
> >> >> >> > before Page::release() is called.
> >> >> >>
> >> >> >> I suppose the existing vm_insert_page() abstraction we have is a=
lready
> >> >> >> problematic, because it uses `&Page`?
> >> >> >>
> >> >> >> Maybe we want to change the API to use `ARef<Page>` so it alread=
y has to be
> >> >> >> shared? Conceptually it takes a reference count from a `&Page`, =
which isn't
> >> >> >> possible because `Page` is not `AlwaysRefCounted`, so it needs a=
 `&ARef<Page>`
> >> >> >> to be able to do that op.
> >> >> >
> >> >> > Honestly, the problem is the safety requirements of Owned::from_r=
aw().
> >> >> > Pages have a "special" main reference, and free_page() does more =
than
> >> >> > put_page(). It even does something when the refcount does not hit
> >> >> > zero.
> >> >> >
> >> >> > The correct behavior for Page is to allow the user to hold one
> >> >> > Owned<Page> whose drop calls free_page(), *plus* any number of
> >> >> > ARef<Page> references that invoke put_page() on drop. This way, t=
he
> >> >> > owned page controls the special drop codepath.
> >> >>
> >> >> This does not mesh well with the model of `Owned` behaving like
> >> >> `UniqueArc` to `ARef` behaving like an `Arc`.
> >> >
> >> > It's a different case, I agree.
> >> >
> >> >> Please help me understand; with page having a main ref and an auxil=
iary
> >> >> refcount, if we model that with a single `Owned<Page>` and a number=
 of
> >> >> `ARef<Page>`, what would happen in the case where the main ref (`Ow=
ned`)
> >> >> is dropped first? Is this legal?
> >> >
> >> > Yes, it's legal.
> >> >
> >> >> My intuition here would be to follow Garry's suggestion and have
> >> >> `vm_insert_page` take an `ARef<Page>`. Can you elaborate why this i=
s not
> >> >> an option?
> >> >
> >> > That would be the wrong ownership semantics. The C side increments t=
he
> >> > refcount rather than take ownership of a passed-in refcount, so the
> >> > correct argument type is &Page.
> >>
> >> Or `&ARef<Page>`? Because with `Page` being `Ownable` it would not be
> >> OK to increment the refcount from just a `&Page`.
> >
> > That's just a limitation in your traits. There is no problem with
> > creating a refcount from just a &Page.
>
> Yes, I agree. The limitation is by design. My point is, `vm_insert_page`
> can work fine with the `&ARef<Page>` type. So if that would be OK with
> you, I would patch that as part of this patch.

IMO, Page should implement AlwaysRefcounted and this method should
take &Page. Anything else just adds limitations that are not needed.
But I'm ok not implementing Ownable for it.

> >> > Now, for the use-case in Binder I believe we could switch to
> >> > put_page(), as we don't need the extra stuff from free_page(), in
> >> > which case we only want ARef<Page> and do not require Owned support.
> >> > But as long as we are calling free_page(), it needs to not be
> >> > clonable.
> >>
> >> You are calling `__free_page` directly in binder? I could not find thi=
s
> >> with grep except in the C binder. Is this code you are calling into fr=
om
> >> Rust binder?
> >
> > Via the Drop of Page, not directly of course.
> >
> >> From `__free_pages()` kernel-doc (`mm/page_alloc.c`):
> >>
> >> > If the last reference to this page is speculative, it will be
> >> > released by put_page() which only frees the first page of a
> >> > non-compound allocation. [...] **If you want to use the page's
> >> > reference count to decide when to free the allocation, you should
> >> > allocate a compound page, and use put_page() instead of
> >> > __free_pages().**
> >>
> >> I guess this is what you are referring to? We could change `Page` to
> >> this style as well and all would be fine I think?
> >>
> >> At any rate, today I learned about Pfn walkers, compaction,
> >> memory-failure, etc. that take transient refcounts
> >> pages. With that in mind we need to reformulate the invariant of
> >> `Ownable` to exclude optimistic transient references.
> >
> > Yes we can switch Rust Binder to use put_page() and have Page not
> > implement Ownable at all. That would be okay, because Binder's pages
> > are not higher order.
>
> As far as I can tell, we can also switch `Owned<Page>` to allocate the
> page with `__GFP_COMP` and use `put_page` in drop.

I'm not entirely sure if __GFP_COMP is needed, since the page is order
zero to begin with, so I don't think it makes a difference.

> > But this case still does highlight that
> > Ownable<_> currently does not address the use-case where the
> > Ownable<T> is a special reference there can only be one of, rather
> > than a completely unique reference.
>
> This is not the use case `Ownable` aims to solve.

Maybe not, but then it doesn't apply to Page.

> > For instance, the GPUVM abstraction would be another case where
> > Ownable<_> could be used if we have this other model where Ownable<_>
> > and ARef<_> are legal at the same time. Currently GPUVM uses a special
> > UniqueRefGpuVm type to solve this problem.
>
> I am wondering if we can make case I intend to solve (Ownable is a
> unique reference) coexist with the "at most one of this ref can exist".
> The "at most one of this kind" sounds similar to the `ListArc` use case
> to me, which is a different problem.

I think they can co-exist. If AlwaysRefcounted is implemented, it is
the ListArc use-case. If Refcounted but not AlwaysRefcounted is
implemented, it is UniqueArc use-case.

Alice
