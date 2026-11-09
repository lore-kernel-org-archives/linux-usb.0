Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794192191;
	b=w8i88po/7t9uP0G9DBqP9gQdnMIIRGxrcLlYKMFKNUvMPc9ibBBeRoCUUfKxmJW05LVp
	 ylEjb2cUQY4y4TP+Xo7Zx8k8Vr7j5niLhY2oc/XiDRTwb+RcCy41AUsgTrasefDHUz/Yd
	 NkvgCbkJTjpNvWIgR72LIypKcVuM+djiUG5P3IsAm5+g3Q13KCf+Kn3JjoPIHNhat2oBO
	 BcjnB5HP2qBAUVFl4T3AcCGQnalFeSzxTa9Dr646V2hwjCH/pSyNAf9OCNhc4jkR/x5ke
	 RY9SFH8jIIB/4HyITHQtB8367D3Fw34CAGHvvviW2sDMmUSNkrSEtO5N0InJMMOXVYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794192191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=lbsHrjkpK1cq0QRwZ9oauLF2GZ88NqZOcvz5poLBJyg=;
	b=hflS4DgY7syNf33NfDOGLW1DTyODTCXTEVS0iWjyhtiDjDiaayFwNiWEsm6LS78WaEwW
	 IGq1HIU+D1rOVN8pQjuITWGjBaP2EYBF0Y8UhMU4RUNp78fsDEdNG2MLVGsLAuZpeGbOn
	 cgSqlOuOylOmkxn0stRZ89L+2sG7TYzgSIa12c9IirNBaD/s7Mb4g/u2Wq/3irQUMsQz9
	 BAYgNwAurMNxQEQ/yJNtkrawYI5OuMxK1AkAMzUHP1sCF2tir8CNE5a3qIQnARekMaFjr
	 /AB/utfKcl+ObPlti4t6x2ulEqT81EZ0GS6HUe7G8TRDWyn72yHq3tLiuq5FEGbARcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=YcxiUDXn;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB295606A320
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 02:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB295606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=YcxiUDXn
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91ecbdf5343so6151596d6.0
        for <linux-usb@vger.kernel.org>; Sun, 08 Nov 2026 18:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794192189; x=1794796989; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lbsHrjkpK1cq0QRwZ9oauLF2GZ88NqZOcvz5poLBJyg=;
        b=YcxiUDXnpdGoN4UNDIjKRdgGGnZ7IRZGhZUgW1CW2MmQjyiWTVq/iI6rZBEyBNanWG
         70ITRqnL3KyUYCT/cvLsnbU0qUMz25jd3QcK2rTT7u87tj1fygaqibdYiu8qEIUBgKs6
         NphDETyO5bAZCWj2PTY3FeQ1Q0oeqPX4LlDqqoShUa8jLwDzLTjVqyO1aKZKmtczdlr4
         e0+/yOx1oyVcg+ZaLQkakN+pOjILyPOY1OsJsxZzbwsIaJoM7zLJqAuL+fdj/sBJ9FF8
         kufmmipNSiQbSwCVTCukxAP+WpH47MV6JYZKq30EXJl2LjPFHpqV+BTny1NNG6VaBJvs
         +2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794192189; x=1794796989;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lbsHrjkpK1cq0QRwZ9oauLF2GZ88NqZOcvz5poLBJyg=;
        b=b+JJcEfp4BLOOQcWfEi0uun16x1VIZDZXgD+Wq94pfA/p8H4xjnVf+j+AbcS2u4t5+
         XT0C5uHicod/y0XZ374s+cySucZS/xkL/f7ZV6OmubPJo9gMCs3/gc9TsEp8gqUmc7k1
         aVANJSUPbg36XZTjDehfLZDhDO5kUmbXebq0INFqE9UU2rRVusGpuKnhZ4eVen+rsFEo
         JvKIw+yNLMbb6SgurD4MiyZd3/IbKRVD9Dr74FSvVLm8a3xA4PL2S7WPo87e/MCfNx1E
         9PqTAli6vq6z0NWm5/3kSv64mpneWPtLzeAZgGbC6mIEd3JsW32KBmbdMcXe7fVjlAnM
         03GQ==
X-Forwarded-Encrypted: i=1; AL+hErGHwArClxctnMSjTiD4jLt7WCHQgkDkOJfV1vjKtbA8gMvsPHEMDQWQkSLTDMYNdJ+I0ynUaGmSf+E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SV+3aUkV5nMOTAPZki4swXZfCXAjwZU6NiNclEhmIYWwaz/R6
	GQmPm5FVeYy6H7W5cS6BIcStRetvJcIZcTfVQDeI//tWSWpGdQqMqZBgiIL3DvCKvA==
X-Gm-Gg: AYBFou2HPEY17he2R+KUel4ApVcMmZAFFAZJmFLwDMazKZg/M6btFkzNCgtLmkqp3iK
	5wf3nFTZeccjGYkjlFyev9/vtODwdExhvCLF5yGHmCHf2LNuKLIVWgd/qJKUm19LXEyKw+wJABd
	Lnc3OaMTFe8uwwWRO9/Ik91DweegvHKEe5XIClosVcdINYMiK5ZGY6ZPMB4dYuu9SbXnZzK72fW
	7w2gVjYbJOoBczM4gDhfUSX9Bshk2NKFlNTopGpirjO1tJoqK9PwvhFIlATdIybr0a7V9NPdMGQ
	eNnh4Gp0O57cZ/awClrYgzo5dqBdyu+6+iWSeLqzxzmTWw/POtyGW4Qo/emHlQR1lrhMxGDsU6B
	Nu7yJwsV52rJO/Z75Bkmj4g5wRynk+N695RWpqV73rkG+xQfoZExtpxWg/BKgr4x0MLXOgD8+NR
	TTh9ZYmGEtRMBt1eQND9UttngiTwXoFotfjWzjsS0DXDlVHoBVqur7Fi8QO5jGeKNvjK1F4ciyJ
	+ojjC48oIVPMhO9vc08Bo2EWvY5EMHi3mP8h8gh3hh+SOtAsoKc7/ZsM4qX9m+yRIzpa0C4SGD0
	0B8ZiZ2rjdD0evSdp2MGwQinJnYG
X-Received: by 2002:a05:6214:c4b:b0:91c:8ff2:51ed with SMTP id 6a1803df08f44-91ebd14d862mr87689676d6.2.1794192189470;
        Sun, 08 Nov 2026 18:43:09 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ecee18a77sm32078146d6.26.2026.11.08.18.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 18:43:08 -0800 (PST)
Date: Sun, 8 Nov 2026 21:43:05 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: kayano050408@gmail.com
Cc: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+c73e1942197af9f54ca3@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 0/2] usb: gadget: gadgetfs: fix ep0 request lifetime
 and event counter
Message-ID: <071e601f-4a8d-4ff6-bf1f-bae9606ade0d@rowland.harvard.edu>
References: <20261107-b4-gadgetfs-ep0-v4-0-86bdfd684b54@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261107-b4-gadgetfs-ep0-v4-0-86bdfd684b54@gmail.com>

On Sat, Nov 07, 2026 at 09:46:12PM +0900, Jing Lin via B4 Relay wrote:
> gadgetfs_unbind() frees the preallocated ep0 request after disconnecting
> the gadget, assuming that no I/O remains active. With dummy_hcd, a
> delayed userspace response can leave the request queued when it is freed,
> which triggers the warning in dummy_free_request() and a use-after-free
> when dummy_udc_stop() drains the endpoint queue.

That's right; gadget drivers in general are responsible for cancelling 
any outstanding ep0 requests when they unbind, and not submitting any 
new ones.

Another thing worth fixing is near the start of gadgetfs_setup(), 
where it casts away the constness of ctrl.  This may not cause problems 
in practice, but it definitely has a bad look.

> gadgetfs_setup() and ep0_write() also race on dev->req and req->buf
> while a control transfer is in flight or while a completed delegated OUT
> transfer is waiting for ep0_read() to copy the payload to userspace.

Can you explain these races in greater detail, showing how they occur?

> Overwriting req->buf with a descriptor pointer causes clean_req() to
> free the descriptor buffer instead of the request buffer.

Can some of these problems be solved more simply, by using a new mutex 
to protect dev->req and related values?

Alan Stern
