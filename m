Received: from mail-yx2-f2.google.com (mail-yx2-f2.google.com [74.125.224.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8F035A952
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 20:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783973460; cv=none; b=cW/RvAS86RpnXCuLwhk8hXP3+t91zhHd6ik5EyMeGWhEeRjb2c1+tGVtZ4hvKJoDyg2dPEcx7AjOLNLhemD97jeI6c9x/cHugyP/vBc4JIsqsyWagT72/3sMxaTTNjz9lPqbvjItC2DshnW7GQFUj5yWVJuDXTq3GLOKvXcDc4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783973460; c=relaxed/simple;
	bh=vlBrbWByJZdk01h6zwXzkPa6wmRo6x0gZW7rOBSyWgY=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tCOzFs8sorAev+5nwMgCre6EtvVMWrO35EkyUcO530W9qjxiABaf9sPv3cJAafXL0UeAD/EiqKQYpV9INE+PzwDURrgEzq9dYRZeCjzYk/+dZg9BIjEDpF6KGMS/+NJfIXBhQBmvZes80ijZR3nKW77+txS4xo0y3+sZuXT0T7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gTlDxEZi; arc=none smtp.client-ip=74.125.224.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gTlDxEZi"
Received: by mail-yx2-f2.google.com with SMTP id 956f58d0204a3-664b9ea01caso2194535d50.1
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 13:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783973458; x=1784578258; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pUWBiC2pS2+p4Cx2dGSdcvXavcIerJRqaSR10TZjZyc=;
        b=gTlDxEZiI+Uo0JmFtR+kvlDw5hvqxUQW+aNpXqSRo9bhswSAyRukRXQREJQJxGOZ7/
         1MaX6Yem0exwWWmBi2twpLH3+jgFlTe6RzLq6CGXK9o2QaD9bvhR76tYsQzddBt9Ii9F
         7Qsp5G7l/kVxZ/sBMhr0UPbXyHtEO0xlrCCY6EEbZSb0w1i+3mtJvOeYU3yUnnzYdrAO
         OWDHLRrJPXnYoVTIiqFVgFt0me05m5qHK2NMFQ9sGEmahW08BcMgVEqexq8/ymAD1ZEN
         HZI4hdQ907Na7MPrqPumQwNzRQa+Tp6evU1Kqy2M+pN9mhV5QgM/9DuDwDoCENY+Xmse
         fgVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783973458; x=1784578258;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pUWBiC2pS2+p4Cx2dGSdcvXavcIerJRqaSR10TZjZyc=;
        b=g/XHnQkUZbd0bCqp9K1mBa/VyWf+C3Du+KF4yFdDkdhtLTS0z7DdR1RD9T8DD/5Bsu
         HYBm9Bmg2vCoV+ZVOuJhRQUYdcOc2blo5G/DEGvHiypWBlQp2lGBny5dcCoFoo5nOqBG
         Ocge8AYB/09PiPLa+7KODh/ndguXjV8IhUPjl58ZzDI1BtSlDJ7r8nKymbPR2mXks1TR
         W2+cTHLU4QstSMYguapK9caXXvAshHMZH+rYeYQ8qjVxpyGl7pl/QVuqwj+kZkraUY83
         4KwbZd+kKJBMAjbbyrRb7rt3R4WKkpYTjGqUnJWrqlva7MiGh/mp0Kl3ELxxR3Qv8dPs
         RDxQ==
X-Forwarded-Encrypted: i=1; AHgh+RrU+J/ZeeIh/EqUjb4ohl8m8ftgn092iEWyfKws78277z5QxR9BRz2YCQ2rofJRNTmIvPbmHIpoYsw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrcreJ9UH0uOAWvayH2aq6bXGopTF46lrXk9aEmudEPnKpBBBv
	XDQHQNKm8Dgp+ZwvvupUSSAb0p5Us8l/IHNY5nWfwqtj1FcOPLYNy9hI
X-Gm-Gg: AfdE7cnjLSEb/eYGjQvFVtlidAqShj36oit0zC/nrGZxlgHzeO+NlndJOBVQqIR7HGS
	Xq0AgulQLrdyRb4M9/kt/em866XMi/yDEPG991LARtth0MXTJ3eF5Z5ZyWmlsCyY3L9/BlSG7es
	fcn4SK3GFgZnvVbEy88anbDTQZ1D97WcKrU2NWF3qr2cgMKvhhuuxFuIIKbPUDKzIuUgkI/+m5t
	BWUQY93PUCtNNqkTf/oNnWu9YEzS+8zwzV5JPNj1+FF8IRNGdEZzGa3Nkx/srmyCffWIcJdQHx2
	G3qWDG5dRKnIMXIoaRgeZv1YYoHO13P+cHzF1Or9TM1cfMnKc/6zN3P0qb/taes1Oj6vIS11pTZ
	FQ3F330BYL6EDJTzBoDywJanKrIU/gBcRj3nBbx4en3Ob9T21seKRqevUFoSNV4JEsHQoAFvd89
	Or8/gDas6vUrMV7s79XFcNKA73B/HWCFEJMOa+mnr6NCbC0bGFF8DkI6aFZdlyGUOHi8GuwzerG
	O1f7Q==
X-Received: by 2002:a05:690e:438b:b0:667:b84f:e408 with SMTP id 956f58d0204a3-667d7a94878mr5694395d50.5.1783973457650;
        Mon, 13 Jul 2026 13:10:57 -0700 (PDT)
Received: from pendragon (76-234-45-214.lightspeed.cicril.sbcglobal.net. [76.234.45.214])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787a5b4adsm14524041d50.18.2026.07.13.13.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 13:10:57 -0700 (PDT)
From: Colin Braun <colinbrauncl@gmail.com>
X-Google-Original-From: Colin Braun <electrolitic21@gmail.com>
Date: Mon, 13 Jul 2026 15:10:55 -0500
To: Danilo Krummrich <dakr@kernel.org>
Cc: Colin Braun <colinbrauncl@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Mathias Nyman <mathias.nyman@intel.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-media@vger.kernel.org, Colin Braun <colin.braun.cl@gmail.com>
Subject: Re: [RFC PATCH 0/4] rust: usb: add usb request block abstractions
 and a user
Message-ID: <alVGLQoPxsAt4jip@pendragon>
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <DJXH4FQ62VED.3T41DAVF0KRDQ@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJXH4FQ62VED.3T41DAVF0KRDQ@kernel.org>

On Mon, Jul 13, 2026 at 03:22:25PM +0200, Danilo Krummrich wrote:
> On Sun Jul 12, 2026 at 11:07 PM CEST, Colin Braun wrote:
> > This series introduces initial abstractions to allow for the
> > implementation of USB drivers in Rust.
> 
> Note that there's also [1].
> 
> [1] https://lore.kernel.org/lkml/20260617145946.1894-1-mike@fireburn.co.uk/

Yep, I saw that series pop up while I was working on this one.
By and large there is not a lot of overlap, so I felt that my patch
series was okay to submit.
