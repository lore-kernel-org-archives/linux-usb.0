Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB4C3B2D0D
	for <linux-usb@vger.kernel.org>; Mon, 15 Jun 2026 20:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781554785; cv=none; b=NoB4Hd2ZrV7Q+2bvzBkLrVvFVrlk02PBoHuvz7mvAj9aM78gccnswmc5aeGetZPckqo4ZwWSGSNvTFHLElYeJHpDNG0L/P4jl2jvN5N4wgpPxzYzPYvofmvJ6FsBAN78zBcfUPvZFPxATKzUAMCKQ+eU/guAH5KNEK1A15EqBiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781554785; c=relaxed/simple;
	bh=061ZRpXOvpEUBfQoZbaaLWrq4ZyrfP7xZUXohlU6zt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k0ufrvBAuTLIVxG406P9TzhjDIctYky5CLKmdZy2kd0Ei2gnbpefiwjTRN61Nby36mW47jsSH3XCQbQKZk7wOsleStS+RWW1Ncnh0TMEaNj4ZTL5zLDIXKWJxs3Fz+tnyq+ukRa4lqOX9D799FOcSv6nI4RrhCEa+6C0PPrM8tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OlBfhli9; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OlBfhli9"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6a0a0b46cd9so304489eaf.1
        for <linux-usb@vger.kernel.org>; Mon, 15 Jun 2026 13:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781554783; x=1782159583; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=62CFI3r/uqAq54jIdUJdPm0vilsCjqWfRG5bIQ6BFms=;
        b=OlBfhli9HS/irnPOvqtCmZMwLE/1QFPVrzjc0fcCNOtgDfmZV7sZr1daVDzSC3I5Dh
         MkWvlB+kzGyP38OBJEWpgmMqSq5mFoqkRb/Nugu6FdzmC1ijk1PL6Tlfg+uYYzn4FVcm
         3OemZpSypRr72VX/jxAgftjMmJ0ykQqaQnreopTNVAjuifY8rJWqj/u6sov/ko/BN5j/
         FBTkbQFc9Qex/pQQKR4AtQXDLr5C4lz6u/3XMo43hIxhTZ3FnQd2dwgT28oByr5zQW0o
         zlxDG+rg8Qw5MsMMwGVtV6+z/BeVFsDTBwwTv9Du0dObieJMP4degkMB3T3AWUa5lHhw
         drRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781554783; x=1782159583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=62CFI3r/uqAq54jIdUJdPm0vilsCjqWfRG5bIQ6BFms=;
        b=iAD7sOZ0gc8/hF0bcyDK4TvMd/6Jmh1WVVBrwboFAptYGmAtG/Pp1aXnxOKt+iCud1
         pRldNEV1rn0Il/Q2RpZqFg59CW+1QXzMVAR9MjJULDaYqXLfqfwjyRp1oKB2+QJReJsh
         FvS6iEm2y6FeJcEhRR5bmneQzlNMNfhpe0Lx5eV9353vcCJLvFiY4/al+HJ4Zh59Esxm
         QexLnNNKeRljzCCYzhgwaYTukhpeLRMSUxjXhT2WJK2wAVgP/X3PJRH0hX+fY5uhwjtL
         kAXTXi0HFgyuyBG4/TKEOs4IOFEV5GdkRTML7WYgg6gbotcGYfeVu7+Nned7uXYXhk78
         frwQ==
X-Forwarded-Encrypted: i=1; AFNElJ88s2U2Ex02asmd2GubvacC2Ac0sncHoiZNN8zbxoSLZKwd12CMrmpmWAbJlS9qabJBcFmyVJVmhCk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGKx32hzZc79Mc/tlgZC+MQY2fp/kIkkwRcVUr9ZpKbFwoHHYp
	7C/0x2HPiDg0E031Tv6bXLaQv0MA6/uIZHtzwjgOZhwIgUlkR5fkyUyHmfOP4lY68Q==
X-Gm-Gg: Acq92OHEXdlP6ysHcarOx33uDR1Up3vy0oG3Kf/jV1FfwHS3llpU8epQT7ez6DixkMv
	tFxn7/HyHHHeWCYxNUwCdmkyFIMKvvfC1tCV/8U20Wt8zrilan2/uO5S0NX+8Z0eTV5Hu0llwH5
	uUgDXDS/JPr3GVDgHrG2RAvXYh4PUiQmsGeV+AlQ8v8cYR6gHWM+Ne8Bd7M6M9VvnzJ/td4pD6w
	b7Lj9IRqPqlWQhT+XB/UEZyc6pCQ4hrxoxZLVkTHd7I6OZdO04dDnZeVaEoaKYGfwKqQt9vQwBR
	xCw/a7dcr6A9MfsTgoPsZ3hLPamszR7n07pjUAjG1J13Qu5GFkkxrBFfNmQW2yo9zTKZrSMd3pA
	O712PesTG1/UmyqF/ihz/jO7lcmdhspmdgintfXA+MceuBKEWCWqYgpkiQIjtHum3wOWeRTZmii
	U7E97pdNSa0IbCAG1OA7uWHVy+frkihpWAtU8LbfTXQEDJwxqbvt0MsjIvg8oB4GQi/hUe
X-Received: by 2002:a05:6820:8187:b0:696:1a25:fdc9 with SMTP id 006d021491bc7-69edc6d452dmr9662928eaf.28.1781554782286;
        Mon, 15 Jun 2026 13:19:42 -0700 (PDT)
Received: from google.com (57.221.30.34.bc.googleusercontent.com. [34.30.221.57])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69f00f50340sm3679813eaf.13.2026.06.15.13.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 13:19:41 -0700 (PDT)
Date: Mon, 15 Jun 2026 20:19:39 +0000
From: Neill Kapron <nkapron@google.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: corbet@lwn.net, skhan@linuxfoundation.org,
	Paul Cercueil <paul@crapouillou.net>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Simona Vetter <simona.vetter@ffwll.ch>, linux-usb@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH 1/3] usb: gadget: f_fs: Initialize epfile->in early to
 fix endpoint direction checks
Message-ID: <ajBeWzttjurOKGV0@google.com>
References: <20260614181006.3648010-1-nkapron@google.com>
 <20260614181006.3648010-2-nkapron@google.com>
 <2026061533-oval-buckle-b90e@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026061533-oval-buckle-b90e@gregkh>

On Mon, Jun 15, 2026 at 04:30:49AM +0200, Greg KH wrote:
> On Sun, Jun 14, 2026 at 06:10:00PM +0000, Neill Kapron wrote:
> > 
> > Fixes: 7b07a2a7ca02 ("usb: gadget: functionfs: Add DMABUF import interface")
> > Assisted-by: Antigravity:gemini-3.1-pro
> > Signed-off-by: Neill Kapron <nkapron@google.com>
> > ---
> >  drivers/usb/gadget/function/f_fs.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> This should also go to stable, right?

Yes, I will update v2 with the Cc: stable@vger.kernel.org tag.

Thanks,
Neill

