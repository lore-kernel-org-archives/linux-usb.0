Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1455A9871
	for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 15:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657752; cv=none; b=ecNbmZOyEsMCF0VIoIOmUDTqo+byBkSylmC5Rd2NkKGJ0nMZIGDfQjREjm0wPKLOluRoPCL6TS0UO3E7BrCtbDWU16giumkCnVb/ACLPTpNW03i3eD1I7QFzmyRJ+vDhuHOs0+n8Uehs3kn8RYKyWL5Tfmj9LO1TsnJbI4krsRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657752; c=relaxed/simple;
	bh=YyZeXPq0Ae8f8lUdWHQOs5TvNKT/kbLtCKws5UuFMkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JAqLwVdUJfKsRHl3+zMzV+KvwNF1BLftdA9ooOxMfaYrte/z+PUZtW60lieR9MzFn9gtrgR5bu80XmpiqeFHEKbDZ4jkqJIGhUlMBU4H1jlNuPn+MnuBULSmI19aiYLg6EMq4RuKyicCXHm0HPDNKbQLIFYiY1UYQC4TsjAW49w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=BOX767Ip; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="BOX767Ip"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76543e2so3465831cf.1
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 08:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1789657740; x=1790262540; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FFzbULtBbWTbkARPGWfpXQTKad5t9+A3qD1Uocl7bNI=;
        b=BOX767IpBw1b291f1zdc5pfC8RklSI93B9CZjvFuOehgZBt4HbEuOhsEOrVYbRcigb
         UVGCG5+gn9L9HI5XVdRDtz0BWjLwGUtXT9XgqQCJc0ZhkH2h+h6qlxSBEUN+04Shtzcw
         j/q9F14OmKbYg00zix/VPk9gcHXu2WQHcF5AoXHyXWv6YhgaS41r3vj1ItSRx0W81bLp
         L03/iiIh+HMK1v+LBOTtclpS4uQj0nd4sSqdCm0QGHBA5iRK1DXcOxDyNPASw5CF4Rfo
         19BQ31LzNmpip9dZdTWADOMHLEnsmda0QmuMdE1Wa0ZZDM0QVFhUYEmnAs+2fMbailko
         2+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657740; x=1790262540;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FFzbULtBbWTbkARPGWfpXQTKad5t9+A3qD1Uocl7bNI=;
        b=EFJcjbwc2uf4eOlI5gZgNgFj6MUieoVv38C190AanHvDPIMLNBsxroWMAyjE/F0YvL
         fauZ0YRuwNi5TO3E9XFtdVjDAI97tKiA7Tnlk3tlinPHZ+7DOVzyc5hty1tMGrDnvo8I
         RnWhtPgkNjnMuAlS4r0H1qQDrS+Iu6KWwOu6zjnSZYIQUvErLLp90NyQV+qTIMtsb/LT
         AdXaGLKIfgiYWhy6b/Ei7Z2iIPXnbhcTFpSEQD2DhKQxfMlo/QkPfLBhEtIQ3Shw7Tok
         ttjmF6lK1eU90aDz42eX2rHxXxtzgQp9mwBX3bG+iRoB8p7F+xMwwHu+7GTqPrherNs8
         5cRg==
X-Forwarded-Encrypted: i=1; AKwUvByUEzTgbJKXYvYJOphNcmdx15SHPB6SCjxm3RJ7w/6fMfSrcgBn8pAFxkoUnAXpzuyInl1a0Dkfa8g=@vger.kernel.org
X-Gm-Message-State: AFuF++l7y/D7/rKOYr3wQ3MmEco5vJcjSVOgonLtCCVw80gdJL9DQsRL
	9GWZwanatjdBy+Kl3Q7Aeh7Dh7C67GQGsmVOHjy5Z5L8Ngys9727IyNTi+8FLGv1QQ==
X-Gm-Gg: AYBFou25ry7bn9+52A8z+s2gimleaz1tSakPslQwAjyWfl9/HtqzIeKF+gXO0d9ouG2
	dIs444Jx5racgg5x9RTRnLpecBhTC+npASvcrTVfGW+tT+MXpvyERlf0ke3F8NiTb6ulrpta1bE
	yArbOo48ReWDt+agn6kuw6W2Hdpmt1LzNUwYmju4pts4781MJEXZy6I9R1xi2UXIfdXjCbdZMO1
	nfMLgjmXyIngUz74TwuCCAtGH14knepyCfeYXRrGywC+fMeowNyFDM47+9OVEzKKzED5ZiE4clQ
	2Bt0rC4bGzJpPBYLM2jUeZLi8s0qIKFHdStrfDu67xkpCQLy0pZCe205D1dngtotvung+rVNfdK
	BEatEi8A2akljsuhxL3gZaoVfNT6l1CJFwVOvR7oWiPa9mT6qv3NK8LynYbaeGRnKNvX6z/isl7
	2aiO1XebaDWvGaH0yPSQsOMabB1JAi5nC00TpBIf4D/YvvPtWevQQBEhe5ALWU8DBnlGlf/wXh
X-Received: by 2002:a05:620a:2888:b0:936:cd75:8f91 with SMTP id af79cd13be357-93bc632c0ebmr562759185a.12.1789657737981;
        Thu, 17 Sep 2026 08:08:57 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b781d94c0sm474614285a.10.2026.09.17.08.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:08:55 -0700 (PDT)
Date: Thu, 17 Sep 2026 11:08:52 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: CJ <firefly0158@163.com>
Cc: gregkh@linuxfoundation.org, kees@kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] usb: dummy_hcd: general protection fault in set_link_state
 on unbind
Message-ID: <bfaf8216-d618-4062-b3f7-ae4da2fccd3b@rowland.harvard.edu>
References: <34667d49.9099.1a09f41e473.Coremail.firefly0158@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34667d49.9099.1a09f41e473.Coremail.firefly0158@163.com>

On Thu, Sep 17, 2026 at 04:00:00PM +0800, CJ wrote:
> 
> Hi,
> 
> 
> I am reporting a general protection fault in the dummy_hcd link-state handling,
> triggered by a syzkaller USB reproducer.  The issue is reproducible with HEAD
> commit cee9395acd8043be0644b25c34bfa86623f2b935 (v7.3-rc1, Linux 7.3.0-rc1).
> 
> 
> The reproducer connects a synthetic HID USB device through dummy_hcd and then
> unbinds the dummy_hcd.0 platform device by writing its name to the driver's
> unbind attribute.  The failure happens during the teardown that follows.

This patch:

https://lore.kernel.org/linux-usb/18ec3122-7566-49e5-9964-1028857405b1@mail.kernel.org/

was submitted at the end of July but it hasn't been merged yet.  Does it 
fix the problem?

Alan Stern
