Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830458;
	b=A20u1LWs/nS9sDJhjgmdcNzeUT7gM4sBaelzO/nZdl+Qc6t8PzpSCEcdqXYo80cTXNg1
	 /C3wpHixFleLfQEYMQRANTdysmYRLibZDFtTt4BgdozXhd0CHlVxME97rUzJ1kNRTblgl
	 5yTBQExHWXe0zwblpri8Td7Mo2FdE7eFh/OOgp/uKHt1Kv4+N2r8xP1tGL8TMgmn58C2s
	 yG8KgzY3gY+4PGdZQk3yaumTP7mFeeZkZL0tzCtmv1FqGz0gvFJBZ72DsmRFYGoi117m5
	 k8SiidHKYdCepniZZyoCfAlR6gcQ3swz8VaJVibTnDnr5Z6JVmecjuPkmnTvlK/HrKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=kLAz6sn1EqmF7aJ7KDEBtraVgj4ybxLcfJJY1MY6K34=;
	b=IyVn/JgrqbBw3TJgEqSlpvjr1ZBuxnzm6hzvllq/iauOiK3gwUeTmHruwogbf0Zq5cxw
	 sPsSbJG5H4G+IvUAtVF4Wyp1YrT4CT2TMkEYi3mGogUN8IeYXcPoHZsnSzFa3sO/4bOnq
	 t7zpayCq5EnVOw6lhZX1qBpV6sSzpLgsBfrTWGsyV02b9AqYtx7+h6HTeibpCAX+rs+gc
	 UXluqZLwUg/Bq7yJNKoooT0d8EcZLs3nVzztdWzmuEwgCtP9EyRUHNi8CG7YNKhL3eR6A
	 Q6HfwcFlbsKgBqT50HF4GLw7uaT5T9CX18fbUNS1azQPAKEZCkUyAM0MYMtNfbDlHhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HPhDK7mh;
	arc=none smtp.remote-ip=209.85.221.69
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D23F606A337
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 12:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D23F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HPhDK7mh
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-492e3189fc9so2149977f8f.1
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 04:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794830456; x=1795435256; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kLAz6sn1EqmF7aJ7KDEBtraVgj4ybxLcfJJY1MY6K34=;
        b=HPhDK7mhvKoexu3wV/J5cAKBVCjdxnE0WqiM219E8yH7eWl2bpFOUxbsfidw15OaBQ
         3v/oOiLCUqOJKC7nE/sfeHMGODuUIsJx0HNirhnEfTrkTSlF6mxsAka4bN3HHTEKuz8X
         I7ILCePljUvo3TBsSDLONNTI31MYsfntJafmj4EM/wfNH8zBljPNWXbjdXsxXgFWpxK7
         QBsjZgUghWzTrvW3gB62VO1cEaBa05GYc2ZRtlRGIidAi9COFMIabjVojBmfGFLgZQra
         H+ROglAj/Ny78kycfy7M7MzfDC6v9ICyF5eD9XUlfn5SvIi4OODpHA/Ny8dfvpbuHFYW
         7n/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830456; x=1795435256;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kLAz6sn1EqmF7aJ7KDEBtraVgj4ybxLcfJJY1MY6K34=;
        b=lnPTl8Ag3y8LbTNYdas7UnpFVL93ygpCWNL643GCnPXbNkzfocKetBMPYQcepwnvlR
         NqrN9enIJx6dz0TrD3Nm3UYuUUlBCpERHKOX8GUnGPGfin6Xn2qdAzAAm3YBWXqQutB8
         dCGkPq4nglPqj//zk0auCxbHqWsDmMpBzhpKJluaRyJz/aCHE+kQsh5KZsIWYK74IVnH
         /ICW60vdXuBlrgBpK2NuLt7c5oRBkkLKPXWhdkyJuKOnS76Vk7yumUhWvNzC+4aOvSLk
         Q7dOJ3GXaKmGbBPW2bUwUnzBK3XEVeJ4sUkZSPlYEZy1RjEtxm6igxqN2r6eECLHPSq4
         PJdA==
X-Forwarded-Encrypted: i=1; AL+hErGERRhG96L/8/1udVhc2E1WcODhV/J9lzg+mDnwScjerKzgSQtw4COifMf3Jwtn7VZf1dfeRuiJONc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Mx0iJYmBLe2zEZawGN+dfq9W51srbTpIk4ipW86vbOep4VtU1
	z9m0xhpfDNEGi0M69Opbahcu9pqzd10JQj67/aRUKk0vm3PCZXxy4ZgwBkpxjKEbFIxyoK32oAK
	cZ8U+nVIhSORTKZ4G+g==
X-Received: from wrso13.prod.google.com ([2002:a5d:474d:0:b0:493:3d97:6e88])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:e007:0:20b0:48e:3697:708d with SMTP id ffacd0b85a97d-49c70ed8e41mr16698595f8f.12.1794830455230;
 Mon, 16 Nov 2026 04:00:55 -0800 (PST)
Date: Mon, 16 Nov 2026 12:00:53 +0000
In-Reply-To: <20261116-work-loop-pseudo-v3-12-8cbbea1cf34f@kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org> <20261116-work-loop-pseudo-v3-12-8cbbea1cf34f@kernel.org>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116120053.371591-1-aliceryhl@google.com>
Subject: Re: [PATCH RFC v3 12/44] rust_binderfs: use fc_init_pseudo()
From: Alice Ryhl <aliceryhl@google.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, linux-fsdevel@vger.kernel.org, 
	Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, 
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, 
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>, 
	linux-erofs@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 16, 2026 at 12:04:45PM +0100, Christian Brauner wrote:
> Initialize binderfs as a pseudo filesystem instead of raising SB_I_NOEXEC
> by hand. This adds SB_I_PSEUDO. binderfs_fill_super() keeps clearing
> SB_I_NODEV for the binder device nodes.
> 
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
