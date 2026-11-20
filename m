Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190912;
	b=iDrHcao5QuPZY2iNa2REWsDEEibvHY+CzwCNWxrqOhnH7LiE1sVhDUqFGhr9i0JD547J
	 p1+fjaigtSvFPCtwICWuYjdi5bN1bPpzmYt9Dm8/PHklfN1enZ6QmsCtBFBHRjQQCiBQL
	 UdFhn91hExUTlJAo7ZCY3qkyVoroQ2BetFdx2yiA6A/R7BZXl4ZVD49GZGRxk/CujCCSh
	 XM97vHeud4dGD7lOjASyWHZAQZOfgZYcbkK/+g+YTd27ffnnGK3uRM64p/tS1zs6NWMNJ
	 ZuVzp46PdBmGJK+pOv7xdrdOdqCMS7dTe8vQ7W0MA+u53FRT6nRLfuarTW5Yh4L7Kow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=KJHdeXgb+8oRA+Qq0eNkR56itfHtyKGNVrXS9DvLfB0=;
	b=U6HodTRbU0ZjDMBMjdhOCiwNB/o1zK6W/ee8Q8Un/cGm0wKL/P2XhlXxaiU4NV800v7Z
	 nKuXNiqo1nNMAriIt5DGLhjLITpJS48JIL4Zm4J0HjUp85tvoomPNW87fsXC+yVq8DiX5
	 TbHpvnNt2FMhmjnkxSjaphZQF8PR5S8hGQLivnlan7T/teVnxvn4djTipp7JU9CqGS6vT
	 N+CGqVJ9qzpAAy7gNAifJMNgieT6MJoITnLfxDvI3wFhQ9ZX3J6+Y1FRkR55mJdkORxl3
	 v++5YdPUi4Yk1KD5UEjugas3aqveEvcN7fM1SI4OhBkY4h3lDbD2+sF4Es1L6rOpTxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=cuUyZqwV;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E377606A325
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 16:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E377606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=cuUyZqwV
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b66d1a08ccso825108b3a.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 08:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795190911; x=1795795711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KJHdeXgb+8oRA+Qq0eNkR56itfHtyKGNVrXS9DvLfB0=;
        b=cuUyZqwVRtfVW7vE8lx1+x9WioLQ1b28O+I6Z/BeSWzgR8e8P2++UfLkZbbFEXxhE5
         S9NgC3FWjt+S16UPYcpgqt9a2wsg1sIrPXExX7Pgc9SEXoJgqFgn9stwySib04t8Em2D
         PmIWviqwi4pjOiQY/nhhtlChPjSgnLjE3w3f/ev2qG/mCHI8XUo6A3qxHXtDnq8Q1K32
         JI5LtL342JitpqNhVxqSGyLQ77EOPORqHW0U/sMIYhic1haSzHG3OQq9qnFcTtQOwSWr
         dX0D2j8+Etjgkvj8ZnQHsSBzOZxQRA/1TFYpZ2vPe73DuQo3KcSzvtXXC5iqTpyIQ64o
         X2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190911; x=1795795711;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KJHdeXgb+8oRA+Qq0eNkR56itfHtyKGNVrXS9DvLfB0=;
        b=wmHMgNPA7rY0mWLfxu2m6DtmQy2RwxeUo0cTBd9rztM1Xkg5YRyA5jS8WTKF8Fep8y
         a6HMS92IQeJ3i9ey40Xk0sfhX5tl2KeAsQk+LDWnj4tmshBdr9OQaN94AF9RJUL/zdAk
         yEzOl9GSeC5FWeTIcuXNFYLLNt0phEfyBaUg/l2ecoNFjzAbw+V7/5/2alxGdRsjB/n1
         FMCNBJKVHNOnvKdxR7ut++j43ksy1a4Dq9P9OIzDwXu/GyFcObk+us8UByiD2wfC+XcC
         DNsJmR/ulYQS90E0+i3d+Aj578WGOrQUB0nAtaLCkv5S8x4gJeb36q3top/HeXm05uWG
         Utew==
X-Forwarded-Encrypted: i=1; AL+hErGs890aDI+9htbEpT5sI4rIc+IOIbbiTW1zdhevRwxE0bu4WXeSOBtiFui+OV/xXRZefaZpIQ10/iQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+E03tvp6yoN6BhLCxlH7+v4sO9bVluO/FFcJba+eVasdqTuT7Y
	3j8Dq9nu56GBJgG1rqsnZsCKYgTEy5deJnKRIf/BjnRDAp1diP4Kj51JmY39gryw/Wk=
X-Gm-Gg: AYBFou1huEMvaE35LmZV0FqbcVyFdkuoc0CslNYxWSgf427BCalY3AUgiKoLO9CnzTW
	+yZ11zs4wPY4VpD6sZH4W75b5pYwx7xX3P7NYOxwV2WOt3UuycBq5rN53u1pMCvCL1UUgohWU3S
	iWcnLEIXAD1M2UMM+cT57CKJItztfP2nUlgLdzv/ncaFYxnZO6lRYtioi3zCCAvjfGYCcFTAi4p
	LR91ar36ioMeFgwPyCs1EUJTITuAT/kKaAgSjLjyumI3tbLZkqFo6FR7HTye8M6CQPKkNcs4nk9
	POwN+pfwOlDU4VXDSSNk07hH105S7aOm/kSvnfv1HI9mPGeFhTGGfPYKewAcXvBzRJOW7Z9s90g
	G/tJ78jkt/EAu4FsGqeEFI9ZCdYmPvCD1BISqzS3D7AVFknxEPPnqfK/ykWFBzhAqiRnVZMu5yN
	GPfk+4UysFXWyI6AbO+KKAU6HlTg+1E6jq2Dw2+SerevFWVF5WQGpJ2AL36l/r12YDnVi1u3tBL
	5FirUK9dzyctufEAiUyOpjdo6JhoRrAx5ed0NwPk3MT1OB4+Lp0Ksiuag2HFMoQrwflU8jovq7t
	Fzh8nCxxMO2gifnARSQ56KqeY+KMa/b3a05i1sOW235xdi6+cE2YxNGJD/IatXphk2QzhmXyK8q
	Yp04cvsC7GKxZL2+uIo/vGeDg6s2TBnoMdEAt
X-Received: by 2002:a05:6a20:7a9a:b0:3fa:5900:6e44 with SMTP id adf61e73a8af0-40205f1edc5mr1443887637.52.1795190911331;
        Fri, 20 Nov 2026 08:08:31 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cea770asm1552917a12.3.2026.11.20.08.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:08:31 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	nkapron@google.com,
	linux-usb@vger.kernel.org
Cc: Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgs201920130244@gmail.com
Subject: Re: [PATCH] usb: gadget: f_tcm: do not dequeue UAS stream requests in BOT mode
Date: Sat, 21 Nov 2026 01:08:25 +0900
Message-ID: <20261120160825.3219262-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026112031-sandlot-idealness-df6f@gregkh>
References: <20261120113956.3071640-1-yhlee@isslab.korea.ac.kr> <2026112031-sandlot-idealness-df6f@gregkh>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, Nov 20, 2026 at 02:42:56PM +0100, Greg KH wrote:
> On Fri, Nov 20, 2026 at 08:39:56PM +0900, Yehyeong Lee wrote:
> > @@ -1614,6 +1614,10 @@ static void usbg_aborted_task(struct se_cmd *se_cmd)
> >  	struct uas_stream *stream = &fu->stream[se_cmd->map_tag];
> >  	int ret = 0;
> >
> > +	/* the stream requests exist only in UAS mode */
> > +	if (!(fu->flags & USBG_IS_UAS))
> > +		return;
> > +
> >  	if (stream->req_out->status == -EINPROGRESS)
> >  		ret = usb_ep_dequeue(fu->ep_out, stream->req_out);
>
> What prevents the flags from changing right after you read them?

Nothing does.  The same teardown that clears fu->flags also frees the
stream requests, from the set_alt work or from .disable(), without
waiting for the commands the target core still holds.  So the test is
wrong, not just racy: the host can take the UAS alternate setting away
between the test and the dequeue.

v2 drops the test and puts the requests under a lock, so .aborted_task()
either dequeues a live request or finds none:
  https://lore.kernel.org/all/20261120160616.3219043-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
