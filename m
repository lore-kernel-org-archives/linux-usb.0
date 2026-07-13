Received: from mail-yx2-f0.google.com (mail-yx2-f0.google.com [74.125.224.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3FD35CB66
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 20:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783974752; cv=none; b=nMc+NXR3PQgmO5cqRiOURa6H80CpnRg2fAUdaK9dXk9UBj8FuCJngrxuvJOl+DU2Tp7ii/kdWZqFWpcnD/MLdQ/kcVNeJEouvRetK3dirbVn5MtAyKAKOadn/J0pJQbqo8KfxlGG+Wg/BY/pFSLmxY3eFZ4lJ7W3qiYHpVS0dd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783974752; c=relaxed/simple;
	bh=LeA6DsgeNiDhTkDsEWQ3JkIksQ7pIMpOvA773uwG5HM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uy2JVVJuZ3q1em0Gn3zKSARaeklmajKR//WS7CLYgEncyrLz4vA0KCUDjtAXWMyfRMLIO+m9L9qLgskipn93Lb4Pqza1zAoWni9X/0GBhLiOBx8lSgKYhqGW/deYXodArSYHTMPphFZvh1pCq6zNrTOmINBM6XzBlyhpBD/3thc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jda4LUpG; arc=none smtp.client-ip=74.125.224.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jda4LUpG"
Received: by mail-yx2-f0.google.com with SMTP id 956f58d0204a3-667d5749f90so1722823d50.1
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 13:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783974750; x=1784579550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1JGjrOW6K9FKh0kd0kkezd88P0I3SYr1VYMTxWuqLWE=;
        b=Jda4LUpGEVpQr3ZWsz7SLqXHnRDdbD/0CZ6x8ZEh92d3ReMNdXRJGiIYJKoTYKCUbm
         EmN0D8t5a3CCgcpFjH3xtDDMFh8Ifc5pWm/CrwSJOO5lPyyzPxvOw91/nVEnD88S5iei
         b4q6r6pitFrrMbHK5fZK+lLK3p3RwHs6rwWkXdOm0MWpzTnmbW4KvNilJkzVO/lXpYnG
         JE6lfx9kKAuSZnDZAf6nUkcx/VNFT9Y/Fqkiqd9evLr4iIg8z0PJ5xzjEa2Fu/TWR1G5
         SCYNn6ewbdi7ix7tjGeBgltXRjp0/uelIGDG+uihhwgfnvfshlACi1qpfZgFWSdcTnaq
         4bOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783974750; x=1784579550;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1JGjrOW6K9FKh0kd0kkezd88P0I3SYr1VYMTxWuqLWE=;
        b=F182rm4gDcmEvQ4dzwH6yTnyhVngSSX+DPnmebYGTlwmXDL0XBKOkgTR1LE7UOBDST
         0r0F9YV0YVwOkTUK9pwtrWuPXaX3a9K8Z0bIJZ/uNh0w9XRzvoAsImxJTQmu7oxPiJnQ
         XJfMDRfXV+U5Mgg5g7px9jIUELAwvEPx8FStAGkscyqY3PMJgaG9l+DYz8F6KyqM7v7c
         n46D3Uf+clxvGFEzlm78uHRicnils/fVqiR9+gDfxQajCBWa7BPC6vsqqaeI1eQMjbLx
         Yb4gpw0MqqWUz7j405Sp/tqCeCCPmdspFr01ImwVq2PQJyCAvVsA8Xc3FkV9UzQbacFe
         nmAw==
X-Forwarded-Encrypted: i=1; AHgh+RrhbD9YDqQ00YEqH6fAsqzFKZ5eYW21PdVDa0Jrbq302KhDzQS3Rr9VX7JNeMDGBRqqtZyrWFzQVnc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSrC7w/XWnaxhSfMBEmUU3ZMXBv7HQWdbBDBtBTJMFOD9gsO4d
	GDUZln0GiXNqLSBri843cYlTGZs9OtCO3vCQx7Dkbz1d+RCCctO23Ssn
X-Gm-Gg: AfdE7ckdy9iopfSIaI+OuY9JJdAXQrRFiltO7RYhIUZA70DYug6VVdobdqkv8+C0iQT
	PDaMDkh0+4hZniNuAsEEW3wzSLJXB1ddOWb3vezMd2FfFeVyGphuu8UqM4ykzGpUD1rxglv5fhj
	1xNtoqWAPWO1+OCBF95ZBwb8ixjfOF4Pb2ECrD/vZ0QT+09KQEGH2NWK/vVuSBVnonS5eGcriI8
	ovt22m0mQrbuMa5kjGqRMrQMGmvlnek+eEbDhTwvWeVAlNx0kRylMqt/sgH6k8TU1laban+uhrQ
	x9uxCejCGNXaJN79dY43uatPVmiavcvOqvJg5e/d4Xjpwa2wFx2eTJjustzgsGEVFnZmrzh6EYj
	OpzSi9SoJB/rWK+9oA1QtQOoKaKb/SysXAhgs9i50Xn6s1oXAvLzd3EUQ+q+NGfqHFzdUi+Tm6R
	QNy5VoFxY5Dv8n8CDdS+ea9ic9bxhP6k8K4ieiU36JlyG71TitpdfOCzzJovpKIDtfdXs=
X-Received: by 2002:a05:690e:251a:20b0:660:4473:6eba with SMTP id 956f58d0204a3-667d7bbf0c4mr6130000d50.47.1783974749743;
        Mon, 13 Jul 2026 13:32:29 -0700 (PDT)
Received: from pendragon (76-234-45-214.lightspeed.cicril.sbcglobal.net. [76.234.45.214])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787a49befsm14450075d50.16.2026.07.13.13.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 13:32:29 -0700 (PDT)
From: Colin Braun <colinbrauncl@gmail.com>
X-Google-Original-From: Colin Braun <electrolitic21@gmail.com>
Date: Mon, 13 Jul 2026 15:32:27 -0500
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Colin Braun <colinbrauncl@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Mathias Nyman <mathias.nyman@intel.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-media@vger.kernel.org, Colin Braun <colin.braun.cl@gmail.com>
Subject: Re: [RFC PATCH 0/4] rust: usb: add usb request block abstractions
 and a user
Message-ID: <alVGanOux7SJ5dpM@pendragon>
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <1E924102-5CC7-427A-9FD0-3B15BA1BEAEB@collabora.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1E924102-5CC7-427A-9FD0-3B15BA1BEAEB@collabora.com>

On Mon, Jul 13, 2026 at 10:53:53AM -0300, Daniel Almeida wrote:
> 
> Have you talked to the media people about adding a Rust driver?
> 

I have not. I was actually wondering if this belongs in
drivers/staging/media, given how much work still needs to be done for it
to support basic functionality. I had seen some v4l2 Rust abstraction
work done but not merged in, so I had hoped this could eventually be a
user of that work. Still trying to get a lay of the land, this is my
first attempt at contributing to the kernel.
