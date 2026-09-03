Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8852943F09B
	for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2026 11:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788433686; cv=none; b=mN1tDgbLozTh1GloBkSX2A0e6CseRuH5qTdkvvWLzqwzXFriVLfNRLxMSCIWgV6slEOn9yVUBhlldX8qdfe4GSa6S32azZwDUCGxiyijHzDiFhjC78F2socD8e9wFgbIt3e5nxyITRmU7jRy+42mv6CqvSbjOdYjq/5apmddvO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788433686; c=relaxed/simple;
	bh=rvqfTzgF9DKFA+Yqp28q1VjR4vNSXYyHAnl0lXZrYB8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s6Bwl2yBnhalY73t1d6yrqT4a1gcooSW+L2NqHtz2gnP3gAgMAq7cp20yNsJhzLVkXJG4u3dg9L2dBbFluZtESZVXnnhBYJqmFZHSK7niRCVdVgV5WHapHDz6YuI/obR+aSB9iZkPbSqghNCAZIrUeMeUiBnv9qyUIFWlEyVC40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fhg/cmb4; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fhg/cmb4"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4956869750eso15513005e9.2
        for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2026 04:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788433683; x=1789038483; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CaxK+DYJmfoOuwo2W3mmfOdgw6rS/SBlQdw3Z3QKNfo=;
        b=fhg/cmb4CEhcMhNc1UVyMeqIZt2ScWuqrUtYFHJjRtzZxVHkVDnNFA6dib2vRuMns1
         aXBCJM9cbZeVvQSJ5WamyPOAL2mlqJlElhULAPV3rM4AzBAZByiHh7lL9+J+mAjbdRPV
         UcPTAvzEKclChA0lEv8klicIXdbeNq78YgKHFNngtAOdQqGZsL0XWn3SBF1bC8sMD0JB
         VDXVYyY1cK/vM3wtxPepsEnuyHIYLHoFNHqbWFEU94NK9DIaSgCjso5JpDIZ1yq4b1Gn
         DyWQ/1NUHIDEtaV3kt60mt2MCGB0Nr0ZJ57rUt9dpcyA67Q+K748wIJXPQ601BYYh7OS
         BMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788433683; x=1789038483;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CaxK+DYJmfoOuwo2W3mmfOdgw6rS/SBlQdw3Z3QKNfo=;
        b=LfqQqkc0fjETRZtLLHiabFC0oONEuFBbeZcjUzoLW2o5BBGG8ZFpbBTWdMZNsb+WxB
         s/oZuep7Ub8/wIk9fr03Ptg8gRVqzz9/amqY9BwkWn/ZRbSTeWzgSBkPed9uZKJDGjS2
         ilKwBNztyHse8WUI/t/f9iTErjFiBTGelQUB3+jZExUivboehzXWZrSZQQWdYT+7zPlq
         aiOdFYb0Zp9dyWRcCAeuz0xWq1rrm2isHjATkr5HO0CzOJTpT8ffHFZ3LI/H0nL/0wsL
         tZ7yp7FfYt2CQTi3FAN8ftsbYVw06PZtcCLxOkkGOik9O92aIWYnx6ThvB6An3zvu4IL
         YdZg==
X-Forwarded-Encrypted: i=1; AKwUvBz/UoNa+b+JtbOVneF0lnACfNYnoA+NMN40KFvjfKBFgOw7MBnOiHD++WnZFTnjWm5xsnIKMQ5U1jo=@vger.kernel.org
X-Gm-Message-State: AFuF++lW7gbKorNzx6VH0jM8t1vBlHvYUgMzFYRdQ46Y0yHyVqRMTxMY
	j+drZgXjkQy9QnAn6Nip2bT/SiBqCop5CUyxM4beY3JkxiJ4PYJMVcjX
X-Gm-Gg: AYBFou0Z/CP3mBpLEZBEEDoSYzk5GorfPzMmosa+0fTGvUxmfxzjxtBciuQarfV37sV
	XV8kqACeJsoLdlIBXeORwNkWDLVe/i2EpkKc8VaPkxa8FSvpiHq4vZiYcwPK318C3jka87FqQHd
	0mxcSiOKXhtdhDmDso2Xp9/CGufwWDvd54BTkNySWY1u7ZQBKJ2WyHjOfUc90gaZzQymyGa0IGi
	jOHBMGOU6YmEWUDdRp8RviK7wUs/ez0qPp7iUwu7Lmo+ni+DPSe87rkzcPASRLaoJRv/Mf6aMuX
	jknqOoiUWI+gi6T8KmtdmGHfXFNClWnq+Msa1vIX3uwNUVYOsrWsktEvoVqitqd4xNm0/TZf37q
	DUM5+gJkZ3kwwV8UFYknWkw2fNA9hW+RtttgX1W9d9i+7MHVo2BmIpi1JikRLDj2NtBzC7NkyUc
	vujC0iORAqV1Sd/FPYJFFooZhLsce8dinVisLJIwppJHmD6iKkjZxDtgfie+kqF9TFo2xIdQ==
X-Received: by 2002:a05:600c:4ed1:b0:49c:cee2:a508 with SMTP id 5b1f17b1804b1-49ce582984dmr169781305e9.16.1788433682585;
        Thu, 03 Sep 2026 04:08:02 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eea5b4sm13400768f8f.27.2026.09.03.04.08.01
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 03 Sep 2026 04:08:02 -0700 (PDT)
Date: Thu, 3 Sep 2026 13:07:57 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: syzbot <syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com>,
 bolewara@gmail.com, devnull@kernel.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-usb@vger.kernel.org, mchehab@kernel.org,
 syzkaller-bugs@googlegroups.com, Daniel Mack <zonque@gmail.com>, Takashi
 Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: DIY allocation or embedding of URBs in larger structures
Message-ID: <20260903130757.0668310a.michal.pecio@gmail.com>
In-Reply-To: <87o6ee8y9e.wl-tiwai@suse.de>
References: <6a6e9502.f794c993.27aeb.0018.GAE@google.com>
	<6a97af8d.27a413cd.1e878c.0004.GAE@google.com>
	<20260903112417.21b76017.michal.pecio@gmail.com>
	<87o6ee8y9e.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 03 Sep 2026 11:44:45 +0200, Takashi Iwai wrote:
> On Thu, 03 Sep 2026 11:24:17 +0200,
> Michal Pecio wrote:
> > So what happens here is that USB core continues to use a URB after
> > completion to implement things like usb_kill_urb(), so URBs are
> > reference counted. Then core decrements the count - one more use.
> > 
> > If a driver waits for completion or even usb_kill_urb() to return
> > and then proceeds to free the URB's storage, this becomes a UAF.
> > This driver embeds 2 URBs in its priv and does just that.
> > 
> > A URB can only exist as an independent allocation, core will free
> > it if upon finding zero reference count in such case.
>
> So, IIUC, now the URB *must* be always allocated via usb_alloc_urb()
> and an embedded URB isn't allowed?  If so, we'd need to address other
> drivers, too.

Yes, that's basically the case and actually has been for a long time.

The only thing that works is for both USB and the driver to call
usb_free_urb() and whoever does last will actually free the storage.
This means URB can't share storage with anything else.

Some drivers got away with making URB the first member of a struct
which is freed together with it. AFAIK this pattern doesn't crash, but
it's deprecated too because it puts a flexible member (in the URB) in
the middle of (the outer) struct.

This pattern here in caiaq has always been one race away from UAF.
Maybe it wasn't very likely to happen, but stuff like PREEMPT_RT and
hypervisors can insert unexpected delays anywhere these days.

Greg KH puts it thusly:
https://lore.kernel.org/linux-usb/2025120716-sway-hypnotic-8cb6@gregkh/

Reragds,
Michal
