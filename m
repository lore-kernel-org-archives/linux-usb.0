Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795812183;
	b=iU7z8vszi0Wt2LgUzt6iO7708V2oOX842kIbpOhmd4dcEMhDIlyflJ9U+wVEwRlzLQJN
	 8X86ziMFzK/Db47JEYvT++8584p6jgvqMpw56yH+7AOms9hsnpTdJVR3ODyokysIgzsfz
	 zTdWxQ3yTpA9q+I7NUBQpHOGRjMQYiZx/peWoNXB5K0vxCecWpvjYim9m7QipGzlAhDvx
	 nk3z7qI1uQQynNj+w8QXAUN87HOlUNzudLl1B6dlVnGETvuFQF7MM4XZAKCSmrfNzWC8S
	 /qhlH6cpJMomw8ATN3HxvbHhrs5gYiSSLskgnDs6VbKUBTu2LbN2I2XLLUSqtzGNRhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795812183;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=qgmz6ZctImkrfgvX+pKXYK0W98PO9D2NXhen3Kg96xk=;
	b=Xd/gzp/7Pphubu0ivCcbhTyFUgTlEZv/7EXFEFP1qYszLde2ugeHOz1HLy+ygwQ0mx9q
	 dpasnQCuN+VMHhV70UUmq1XDiyFiZo9XMTKZF0Q4pdBLZPBdtHxZNzfOIh8VOkfZYUqZY
	 jx1fRKIF01VYGX1KyKN9E5FLEXXtmRk1h0FhMusojifxKknvOv0wWVa5Xf/epMyHmrCbX
	 p3MG2BjLUcfLMFehRTOH5GnamTHd++JGDH6aacc+Ta0lM7LsKt047pK91xc5FOiAB0HNv
	 YnVUGU5S750Zzy3W7f9NacwYUwTBa46+XmRsW5RQDeheawA5UPSVCMCuDFu2ZeW6VZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b="cNdaiH/F";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Bzmk9ob8;
	arc=none smtp.remote-ip=103.168.172.148
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72D4606A31F
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 20:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E72D4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=cNdaiH/F;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Bzmk9ob8
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.phl.internal (Postfix) with ESMTP id 24024EC0B76
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 15:43:01 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Fri, 27 Nov 2026 15:43:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to; s=fm1; t=1795812180; x=
	1795898580; bh=qgmz6ZctImkrfgvX+pKXYK0W98PO9D2NXhen3Kg96xk=; b=c
	NdaiH/F1Q29gFcXCADDa/yczNI5o0ooekMLKvAnpblw7Fwp/bnN+j9f+dEq/Mdd1
	kRBDciUHI/3jhT+sbJLUOkKJ9HqQNroZkTSudoAt2NIFxcGncMyOfNaFABV7KyZn
	Y66jOetwv5dUZg1cT1icBZWjWk2J2ciPRDuLkHIpQum+4xgRJla/nbI24VktAH9q
	Ml/xoi+XjgKG0Zr0qZmNMDe4g0Hwyaa8EoqnaxhKYNGHS8RTiaFn0vu7wiYi0Di3
	oXZXlh0MMp5J526iUAqZuUk+c/OWKRmx9GlVcE0Wj5K0tyFMqICr56XcbDD1nitO
	mzyK7xrOFPHnKBSTA4NDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1795812180; x=1795898580; bh=q
	gmz6ZctImkrfgvX+pKXYK0W98PO9D2NXhen3Kg96xk=; b=Bzmk9ob8JGySVhC6n
	HQU8MgTZU906ceaUy3Lf4DcIEr3ZN9VWZqpQMOfT6AQKtGy2h5Goamf7Lt/AO9si
	yOV4qi7kVUAo5+U2/ocqpWW37q/ab1rc3wBGVljch9RYBp/HuHbdNZKx1Gy2RroE
	LgLryh6n7Av7aFN2N5C+gbuAjnI1BmMX3NFHauGNi1LV96Az7dnVX2DaUlLeRxNc
	M4m4FcPuMK8UkUd+oyFs7jV0gfNlLjDaoSAFbgBBYS2mIQ5mYYgOmBb3SojzP4lF
	1sk8BiI+/vKVNJb4ZhUlT7Nqv5yAR6SeLvuo2H33E9kE+ZiTAZuM9XCndeqVq2/F
	FdBDQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795812180; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:FJrmi1j88bxZRq+NLWNe6z3XLq99ph8s2mAyxGrSo9ASOgR
	kB9Ma4JGNYkUtWH45z6+oc2FePs2dCzCWlIRnOkb7hxBywEUf5wjTBr7HRwlTAfj
	zVt0IEntxJWf4Tw2wgmpudFDpe8HMj61sqrEC1GFeTQ9yI+nnf9iruvll2puIQ7b
	C8JHBwRnQmzXdPOs/14pLIAEKkFqBWeVt7XqIX+gYVhXPKesrsE09/F5W8/XhfV8
	zTymej9E2P2HE8qTXHCF3n0/x/XdxAR/zd21EhW0qvTL78YD0hNY0ixjnevXYPNR
	Pf+LyoapyrgO4y8IGWv5Tei1lDuLJhkorxLVHUA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject;
Message-Instance: m=1; h=sha256:rwjdhJBOMbvQ0dOhJPhSK3jWaceNmzaoFUXBxGSpp8M=:CC37maM1gelB0JZ8V6HxxW0Tf2M8/b//esNtkZ2tK2A=;
X-ME-Sender: <xms:U-sJa4zhZvGM6iSW7u7kGfi0pvhfzMRRwREI8iLXBuzse0M7QM4sqQ>
    <xme:U-sJa3GkEGiVSb8zFfRiQ9lxKoVXawP3dFWsjRCbT9Q4op4kTB4TVEETlTVZdQQFZ
    OyAleJPhOHDK_vqaIrLDKHv3VfbFwz2qaJrUMiaz_QszJ_Vxd8kJpVR>
X-ME-Proxy-Cause: dmFkZTFMJhyuAlD7Hq9W6jORRKH6AGo9QiSb7NUIjTpcHN3RNkg9V487q/4WXnLNQk77I/
    cIJyGc/b09BysQ4oPTGy7s1KCLeiyRkYEVFklAqO45UxWIvUjxb77TAubEBKwIpduDxHYo
    lXBZDiLx6J1URN+sINPRg3jsQgFvWJ73kZ+PunJ370OYHIFsInSutUJyJySy9jCgk6mbTm
    w08DH1xLcpLq3bhflPz/45+NL8pinMotYWgxinWP1UJPP6nb/8gf+MKhfEV1AXNdugP4Lv
    XTvMMwjD0Spllkt+MNfSyNNJCTDSKu0c5ff7RxrNuBQRZTkFg91ofgZDV8GqZ1EprcK3DK
    pPnUmK/xGaK9D4LFcNjEriRyGPlEG89BUTJJcN4wpQPj4tkBvSHJqQssY7VN71/WcFPGOk
    JGXLuJEp0qrgro90NHVwLV/6vWezTMqBhd/ZVBJZFmkrnxTKGR4jFnjBivWZEGn9ctB+hN
    0lWNdmR5EWi4wKSkoiVMTdw/EVCyezTBAl36d+qTk5yRY1+aicz4W96ODWmbVPIPN+Ny1Z
    +qGbnL8slceQlHFSqzSvj7KX8l1cmv8LckitB1Y3pttB4VPKLr+f+MGRwiuxYCxTSnXZ3V
    fUuPZ1Fv2xGiXPnymbarD+UeJ5UQh5ptSI7nSKLa1HRO9pyh1JNhyKEU8RZg
X-ME-Proxy: <xmx:VOsJayeyWvQ3UhK6nTzJ47eQOI0c2cbCqQfOWYJQjzPsFlth2gm-bg>
    <xmx:VOsJazHLza_V1AAVOf8icnSxnLFVlfPIkxR026aq_jx7roS3j_HDlA>
    <xmx:VOsJa70cbDGrY0R7aOqnTtk_6JocpISfk0kpUCIlXph-coxrk2M6Qg>
    <xmx:VOsJa7k0txaTjh9oOIkG8E9vh0gYLTF6xdvrYrbhyUsa1GjnzKav3Q>
    <xmx:VOsJa0VxZTjw_OVmCtWXUXOUsnAqLw_8rXvskHJ64RATDoI6Vpn5TZSR>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id C52B02C00085; Fri, 27 Nov 2026 15:42:59 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AhK4IBiDdJJ-
Date: Fri, 27 Nov 2026 15:42:39 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
Cc: "Heikki Krogerus" <heikki.krogerus@linux.intel.com>,
 "Greg KH" <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <9f5f0a57-dde5-44c9-ade6-96d1b8648ebb@app.fastmail.com>
In-Reply-To: <20261104205654.3518943-1-mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
 <20261104205654.3518943-1-mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH v2] usb: typec: ucsi: Retry if notification enable timesout
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Nov 4, 2026, at 3:56 PM, Mark Pearson wrote:
> Found on Thinkpad E14 G8.
> When UCSI notifications are enabled the FW does not ack the enablement
> itself. Future commands will be acked correctly.
>
> If this happens try enablement again and confirm acks are working
> correctly.
>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
> Changes in v2:
>  - No functional change. Rebased as requested
>  = Added Heikki's review tag
>
>  drivers/usb/typec/ucsi/ucsi.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 5aab8ab9f013..6633ad6658f2 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -2095,6 +2095,12 @@ static int ucsi_init(struct ucsi *ucsi)
>  	ntfy = UCSI_ENABLE_NTFY_CMD_COMPLETE | UCSI_ENABLE_NTFY_ERROR;
>  	command = UCSI_SET_NOTIFICATION_ENABLE | ntfy;
>  	ret = ucsi_send_command(ucsi, command, NULL, 0);
> +	/*
> +	 * Some FW may not ack the notification enable the first time.
> +	 * If this happens, repeat to confirm it is actually working
> +	 */
> +	if (ret == -ETIMEDOUT)
> +		ret = ucsi_send_command(ucsi, command, NULL, 0);
>  	if (ret < 0)
>  		goto err_reset;
> 
> -- 
> 2.43.0

Can I float this back to the top of the mailing list please. I don't believe any issues have been identified and the initial version was posted back in July. This does fix an issue seen on platforms that are being sold with Linux preloaded and Linux users are using - it's real.

I can see Dell and HP fixes being pulled in quickly - what am I doing wrong on my side?

Mark
