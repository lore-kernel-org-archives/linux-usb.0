Received: from mail-m15567.qiye.163.com (mail-m15567.qiye.163.com [101.71.155.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392BA37756F;
	Sun, 31 May 2026 07:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780213047; cv=none; b=V9IPmRPdsn6xl4l93PxfWDUTcJAFCrQFqgsbzsV7u3Iy6aCcuihXbo0X6EB2tsLFGDBJZ5I1dcvl/73lE54iXmedAh+hnGoxYKWKKU1Hofxgv13sYfmqJariEV8JSciNkkNQEoeTRp7IWInJNP46/QdzdNWpQE8o66Ks74NpMd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780213047; c=relaxed/simple;
	bh=4y/wqAEW5AaLhHqY2hNhbhkXKxSDw56N/PxgLo8hM+U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PJwk7483EzI/esVRe5ymqy3o4dI5FooP6sAydQRINTkWFk2EJZipNfZz5dVLnhW2R4KA0/+vdoaUOx4IEKV7nfq4OwHgzijF0LgMxI0NKuRxzhLjE9fkqr2RKr319g89ONNxaGuMCm7XszLu0d3giqd0y0TRmLzbQTWzT/XSg0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=r8lA+Joy; arc=none smtp.client-ip=101.71.155.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="r8lA+Joy"
Received: from localhost (unknown [222.130.22.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 407609810;
	Sun, 31 May 2026 15:32:03 +0800 (GMT+08:00)
Date: Sun, 31 May 2026 15:31:59 +0800
From: Kefan Bai <baikefan@leap-io-kernel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Alex Shi <seakeel@gmail.com>, linux-usb@vger.kernel.org,
 si.yanteng@linux.dev, alexs@kernel.org, dzm91@hust.edu.cn, corbet@lwn.net,
 skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 doubled@leap-io-kernel.com
Subject: Re: [PATCH v7 2/8] docs/zh_CN: Add acm.rst translation
Message-ID: <20260531153159.0000636c@leap-io-kernel.com>
In-Reply-To: <2026053149-flaky-shallow-2460@gregkh>
References: <cover.1779355170.git.baikefan@leap-io-kernel.com>
	<9f865599e837c90d3048b9a8004efd65b2e3f9d3.1779355170.git.baikefan@leap-io-kernel.com>
	<a6752fa9-b15b-4b50-baef-53c36460311e@gmail.com>
	<20260531145704.000061ae@leap-io-kernel.com>
	<2026053149-flaky-shallow-2460@gregkh>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=GB18030
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e7cf26e2903ackunm17ae474b15c35a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGUhKVh4fQk8ZHU4YThkZGVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkhLVUlJVUlPSVlXWRYaDxIVHRRZQVlPS0hVSk
	tJT09PSFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=r8lA+Joy/THpantB0LX0uTTBYQazyTHbAbBaI8d+GqImlQJy2jgyly7yiycygzTd1GPwoC7j5wYa4O7AUvstS0i365o+Vjm4bijZSQnQ3xV+/Fflok/I5G9spzbhjbkbNqC9ELZ9u4Xu2bPHPZlqN7lYJlFuOnJ1uRwWamDyBeChqCMe+qwHrSchsuPDoCVegyxXRLxnb3+FZCeYGkrM9rs2qjr3Z8meNPdwjBKQLPgGq22T9DPBb9Lz1ST3Fm0Dv1UZkWZnsGn5X1V+FGYN+uph5+mScop89QqwYTEXbov3uFNpk7/qEXhKChnfeDa8bkmafmzXfC2jmqU3x4b4zg==; s=default; c=relaxed/relaxed; d=leap-io-kernel.com; v=1;
	bh=kb/IvFenX7DUCg3lu6mdJYbbfZw3ctU32Vp9sxf1gCQ=;
	h=date:mime-version:subject:message-id:from;

On Sun, 31 May 2026 09:23:02 +0200
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Sun, May 31, 2026 at 02:57:04PM +0800, Kefan Bai wrote:
> > On Mon, 25 May 2026 10:05:23 +0800
> > Alex Shi <seakeel@gmail.com> wrote:
> > 
> > > 
> > > 
> > > On 2026/5/21 17:55, Kefan Bai wrote:
> > > > Translate .../usb/acm.rst into Chinese
> > > > 
> > > > Update the translation through commit ecefae6db042
> > > > ("docs: usb: rename files to .rst and add them to drivers-api")
> > > > 
> > > > Reviewed-by: Yanteng Si<siyanteng@cqsoftware.com.cn>
> > > > Signed-off-by: Kefan Bai<baikefan@leap-io-kernel.com>
> > > > ---
> > > >   Documentation/translations/zh_CN/usb/acm.rst  | 147
> > > > ++++++++++++++++++ .../translations/zh_CN/usb/index.rst
> > > >  | 2 +- 2 files changed, 148 insertions(+), 1 deletion(-)
> > > >   create mode 100644
> > > > Documentation/translations/zh_CN/usb/acm.rst
> > > > 
> > > > diff --git a/Documentation/translations/zh_CN/usb/acm.rst
> > > > b/Documentation/translations/zh_CN/usb/acm.rst new file mode
> > > > 100644 index 000000000000..51d6eb8f5660
> > > > --- /dev/null
> > > > +++ b/Documentation/translations/zh_CN/usb/acm.rst
> > > > @@ -0,0 +1,147 @@
> > > > +.. SPDX-License-Identifier: GPL-2.0
> > > > +.. include:: ../disclaimer-zh_CN.rst
> > > > +
> > > > +:Original: Documentation/usb/acm.rst
> > > > +
> > > > +:翻译:
> > > > +
> > > > + 白钶凡 Kefan Bai<baikefan@leap-io-kernel.com>
> > > > +
> > > > +:校译:
> > > > +
> > > > +
> > > > +====================
> > > > +Linux ACM 驱动 v0.16
> > > > +====================
> > > > +
> > > > +版权所有 (c) 1999 Vojtech Pavlik<vojtech@suse.cz>
> > > > +
> > > > +由 SuSE 赞助
> > > > +
> > > > +0. 免责声明
> > > > +~~~~~~~~~~~
> > > > +本程序是自由软件；你可以在自由软件基金会发布的
> > > > +GNU 通用公共许可证第 2 版，或者（按你的选择）
> > > > +任何后续版本的条款下重新发布和/或修改它。
> > > > +
> > > > +发布本程序是希望它能发挥作用，但它不附带任何担保；
> > > > +甚至不包括对适销性或特定用途适用性的默示担保。
> > > > +详情见 GNU 通用公共许可证。
> > > 
> > > Hi Kefan,
> > > 
> > > The alignment means we will try use the width for each of lines,
> > > not just stop for each of punctuation. Please fix all patches
> > > alignment, try to expand the whole width for lines unless it's
> > > broken a word or unreadable.
> > > 
> > > Thanks
> > 
> > Hi Alex,
> > 
> >   Sorry for the late reply, and thanks for the review.
> > 
> >   I understand the formatting point now. The translated text should
> > be reflowed more evenly, instead of breaking too early around
> >   punctuation.
> > 
> >   Greg queued this series in usb-testing on May 21, 2026, and then
> >   moved it into usb-next on May 27, 2026. At this point, would you
> >   prefer me to leave the current series as-is and follow this rule
> > in future translations, or send a small follow-up cleanup patch on
> > top of usb-next?
> 
> Clean up patch on top would be great, thanks.
> 
> greg k-h
> 
> 
Hi Greg, Hi Alex,

  Thanks, I will prepare and send a follow-up cleanup patch on top of
  usb-next.

Best regards,
Kefan

