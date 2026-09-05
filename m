Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D932DCF57
	for <linux-usb@vger.kernel.org>; Sat,  5 Sep 2026 14:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788619561; cv=pass; b=XTU35+7ff4rwzmIbAjhRAWvN6JYPkJJhokiKmYf6q3LrBBcj6Cx6h5SrfRKBu4MQFhf5bzh3I5yhNjSYyxmONAjvUA12mAIMoyFEqxDowOdlCuNmWjWsOJymifPofhx9t1uwHQoaB/gHS8Qw3xzZMTKpVSJuTCeUs6MhjYnNmoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788619561; c=relaxed/simple;
	bh=L8myuZh5TkwP8G3mvqfKjytXnbslLjt5FQVUN/hw4OI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qaqv0s4pyT0b5NvHr/BdY6Ct1cXGiG87rN/F3vZlHYV6ahVsJZS/2d/we+RCRP4M24iyqbG0enkpj5aX61YRyTHF9bQ0kEVTf3lScy3/qdZZ+G7AyshcEYuDam5Q9oKh6Cp2BgVCHfQOiaaBaW4gNY2bSfNMoqcxm7p0ALHZuNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+EL7MIq; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+EL7MIq"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-381b831d535so3230244a91.0
        for <linux-usb@vger.kernel.org>; Sat, 05 Sep 2026 07:45:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788619559; cv=none;
        d=google.com; s=arc-20260327;
        b=U+Ij4rcHCIHbtZrDBFGFJe3flF3MdVL3mKfYpn+LSmYgtzCYgkAcmL2gMBBsDZLhiL
         Qn3aoEmTLdH6ldD4skrINwuvbPHGgFLuvGXdEFrjcsOAleePEPucFIrf/p4v2viR9xha
         1n2oblC5HYDSVXqMEDEW6ObyK0h6endP4Nevr8Nn+dU2guCXuFvQBUAiqB7bHTIHoITN
         L/ZP5RnMZM6ens55wgYJUiL4j8y2HIeQfMT17K58ozdocYGEvH7EVonp5GFuCZJRK/Ie
         X/XrRTl5uxaNvZwhNg7fzmfsyuONeqLUifN4I0unV4qLvEXf9f/Yh/hv26P/Ajeco+HB
         yv6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+KCLbwA7nct8QwO9oRt8cDRk9p526AwNAjfsXhcPbqY=;
        fh=4UzIszEUTI1vVzfguSooDew99fY5+h2HBeiFpiuAdG4=;
        b=VJCRclwpz9pWFClOunF0TZ3dJcqI4mHIOAeIVOPMibXP8DI0caduud8l+ntnlb+8Se
         5q4tSIrDZkvecKp1Y5946M0J3B+DwLn82sbp9XjKTEVKU6JMkidBl8tpcfiHvxHZN/g4
         Vqd+A1l8TOty2QVT9ddRVT0w3oH9taHL6dDLYGR1cLX65Y1tF6myI9jlbKql3AAy2N9O
         slP2rS7q+1tREUw68QxKp1Tpg+8aIqtDJcCChlv4qxBLu9vRxwvste69bOZvlwEJOjsV
         IkpFQ6qT5ODeqy3M5X7jc4j6EGKQeShjQ/EtGkTPY6ei5r6NjkpRWqewQGWg3aNe3+aa
         T2RA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788619559; x=1789224359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+KCLbwA7nct8QwO9oRt8cDRk9p526AwNAjfsXhcPbqY=;
        b=H+EL7MIqBrw9ngrBroY6NT3zYKP6M2CpJoAoCvJ0fu0VJaPe8PdNxW8KsBIDK1OR2B
         CxSi/tWBaf3F/GaBeeZEwTNzRkAAFDipoSTs0SeNpVvyVPgSn2sC1dDFfNSHStBYr/uk
         /A8ZIi59rGibzUWOjrCUbF/HJsqCfTGRb/3kBY93hRIjJg7FASH0E3/ee9VpWPbBvbQ/
         kwXDlcrmOrH2PjW30IdATSTyr91WSbXii8/yzalfzCik3lA9HTJ7wyk416XWkyLXToQm
         KysKg3tXflgBnFrHCtQfP5OYKvrFWf7g57U9YKFJZbvrFCulZbKmtQEh0VtXPfACTsyQ
         5mug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788619559; x=1789224359;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+KCLbwA7nct8QwO9oRt8cDRk9p526AwNAjfsXhcPbqY=;
        b=LKqxnwgJSacgSKFEoA+AGVFV8qGr6i1IJsDsV3xJiunfh12rXcJRuf3dPaprY4y/ne
         eqye2+2hja1DNErga+JZT7yD5or8nXEXJbvfUTN4vsYo/k94WAf104/k3KVRoESKhGrW
         Ny0e9CYTo+JpaZT9EAsQnLDRAfl0ImUh+c4Li2O40eAtaHbT1kfkh6MsTPweDkMOOBEC
         eRhFAI/QqcPR0hRXMl3XpX0Vw5sBB0/v43hOD97Arb6PowRdvYf+NB/16o1NPkWaTbxc
         qp1NKlox6tC0kx6vRVy+I92tB+5U6wA0usvxg0GEnqUOYOJi4KtzwslA9Zc75b5buggc
         w8Cg==
X-Forwarded-Encrypted: i=1; AKwUvBwT+4rZAMTUlMd0vCq10TzXVku0NB1uWCweMrUcqU70HZM5flZCImvRLVYYTVwuZP7QGgi9+GEwkwU=@vger.kernel.org
X-Gm-Message-State: AFuF++nDRf7apksJjfvniRUBrlECX7ZBR0e/k7pxqq+T2EPLhaktbTP6
	SDa0ezpx/xoDMCCLs4lRufGAG7uDEifu39LY8/XYv7I00SmtyixAaixXtEjyjI9RQFsRVdp+/Yj
	lKNu38c/AZPPqhri4nA2y/6WcZrLOY24=
X-Gm-Gg: AYBFou0lbLAm7M8Zq3B56gGLb469KDNOdbUQhrLUnBrIc3nicbyr9peTueKF+wumVUr
	ZvGdUMnCBHh+0iCHEXiGo+a+XvWH3orJa/DQFKlLGW2K9FlsjF0/b/NbQLpWATbjwGCQTgUMLUA
	raI90WYB6DMMgrZeoC4dKI6iQLJInoTXRU8Glddkw2DFXsbJYx1WtcfwMlfmxRCoKTekLt18Y0Y
	aqhvDnDVQdLgqRDR0fL3ICa2ACTJiKmq5OAzlVDfhm+zaTDYvKgHAiorXGiaSxEzM5ZV9Np5USu
	yImLgoq0eVfc8JwwCuFMcNBcgYxRreZZwLmuA8Eax/OUiLfUpVu4j7DUzw==
X-Received: by 2002:a17:90a:da8f:b0:398:9be5:b41e with SMTP id
 98e67ed59e1d1-39b26299957mr19052578a91.25.1788619559191; Sat, 05 Sep 2026
 07:45:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904163827.216389-1-adrianox@gmail.com> <0738d3db-3861-4eb5-9847-bde865a1bb28@rowland.harvard.edu>
 <CAMGU2hUOyoWAG-HVCvchqqc4R4uQ7QHaJ_GKGK+hUWw-=Z2deQ@mail.gmail.com> <c97a6204-5e6b-4306-a4f9-86b41c268dd1@rowland.harvard.edu>
In-Reply-To: <c97a6204-5e6b-4306-a4f9-86b41c268dd1@rowland.harvard.edu>
From: =?UTF-8?Q?Adriano_C=C3=B3rdova?= <adrianox@gmail.com>
Date: Sat, 5 Sep 2026 10:45:47 -0400
X-Gm-Features: AcwNN1XtQEQ_pkuG-2xPBm3A-z93hFq1xa7PIMviZ7b9vd-j1Jm40nnWaDevMas
Message-ID: <CAMGU2hVGz9PwXhi+j3z0Zn0keUPt6Y9ArU38tpSRYw5ZHupDZQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] usb: gadget: inode: fix use-after-free of struct ep_data
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	syzbot+7bf725ed337e37307001@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El vie, 4 sept 2026 a las 15:27, Alan Stern
(<stern@rowland.harvard.edu>) escribi=C3=B3:
>
> On Fri, Sep 04, 2026 at 01:31:29PM -0400, Adriano C=C3=B3rdova wrote:
> > Hi Alan,
> >
> > Right. But that patch makes the inode the sole lifetime owner of the ep=
_data
> > (deletes the list call to 'put_ep'), but ep_data is also linked in the =
list
> > dev->epfiles and that reference can outlive the inode (it doesn't happe=
n now
> > I think, but only incidentally).
>
> Okay, I see.
>
> > So in the patch in here I decided to go with a refcount approach, just =
to
> > be safe.
>
> The patch description could be improved just a little...
>
> > El vie, 4 sept 2026 a las 12:50, Alan Stern (<stern@rowland.harvard.edu=
>)
> > escribi=C3=B3:
> >
> > > On Fri, Sep 04, 2026 at 12:38:27PM -0400, Adriano Cordova wrote:
> > > > gadgetfs_unbind() -> destroy_ep_files() frees each struct ep_data v=
ia
> > > > put_ep(), but the inode still points at that ep_data through ->i_pr=
ivate
> > > > with no reference of its own.  A concurrent openat() on an endpoint=
 file
> > > > can therefore reach ep_open() and dereference the freed ep_data (th=
e
> > > > mutex fast path), even while the inode outlives it.
>
> You could mention something about the inode's lifetime and what causes
> it to be released (and when).  This would make it clearer to people like
> me how a concurrent open() can race with inode destruction.  But I
> agree, you're right that the inode's pointer should be counted in the
> ep_data's refcount.


Ok, I'll send a v2
>
>
> > > > Give the inode its own reference: take get_ep() when the endpoint i=
node
> > > > is created and drop it again from a new gadgetfs_evict_inode(), so =
an
> > > > ep_data can never be freed while any inode still points at it.  Thi=
s is
> > > > also safe against dcache pruning, since the inode reference keeps t=
he
> > > > count >=3D 1 until the endpoint is removed from dev->epfiles.
>
> Now it all makes sense.
>
> Your patch doesn't handle the case where the gadgetfs_make_inode() call
> in gadgetfs_create_file() fails.  If that happens, the refcount will
> remain elevated because there is no inode to evict.  I'll leave it to
> you to figure out the best solution.


If gadgetfs_make_inode() call in gadgetfs_create_file() fails, it returns
-ENOMEM and the error path of activate_ep_files() (where the new inc
to the refcount is) kfrees the object directly, bypassing the refcount.

>
>
> Alan Stern


Best,
Adriano Cordova
