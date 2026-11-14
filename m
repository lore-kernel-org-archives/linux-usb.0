Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794689085;
	b=08Hqp2I+YkbyCwKCk2FCEsixww2pl7sfu4CsKKcMNpYgz2J+/RfqRa1ZRs36X3lSYte9
	 JadSF3QPn6+SEVBXKUQhTIb3r7pak3Aed9IuIklsnIYkNQ8UFJHBz92ySQEbbvH4eIecn
	 Ne8hUEq1pJHvrHj+bDPo1i03aTWGJ6CpGo1+2BI0K7U1824d8+XJ3H7dAjKP5lTpTliji
	 IkQBI3F6q39OtXhVbAV6GUIEaTjIycpdQiGEltPSIcjNm2iSMAhmUIe+n02F7rPYucVEW
	 fh4h943DLzrE0kiosP9HZfCUSxHktSRF0w4rG1CE1lt/5NUVCpgRnq7H8SHlhL7M0Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794689085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=RF5riISKB3U2P5GXHOTUJqXWoYoCQ7YYxFY6WjpFX3Y=;
	b=fFUmbXa49OKQnn19Yr0j/3CdqxEhkCtagVkvR6CiM18rVwIZBYizEcs1vr9sXlaRAjan
	 v+P1MfGxV2eowXjbRXZcpWfGrf3Z++l/N2KpiMnsTsuJHWDaLAu/K3YWUnT6ZDQgFBiwh
	 ib/cjHKrC30AtPXaxmaXu7FUqW8drSYyL4AP2frcJlD0s8ww1qlnPEVI84RfHMm7LBvRR
	 s0SfKv0sVPfTU8+FRwB16/S8P6Nq/Y4mfMf9N5/FDukGBaP9Y6Za7eHZ7hJSMs5EhlKFX
	 3kwSN8SfnCMWyQ4aMDtef2nVKyTlBrTew1rQ9wDD/OGAAXPGztYW8y5YrnX5XyrxvTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=MrBgLup5;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D549606A329
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 20:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D549606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=MrBgLup5
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-55d03bfd477so5313201cf.1
        for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 12:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794689084; x=1795293884; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RF5riISKB3U2P5GXHOTUJqXWoYoCQ7YYxFY6WjpFX3Y=;
        b=MrBgLup5MVsN3BKP8C0z+OVZ4AjO2TH2ZPH5xlez9jhjeZpX9UXub5mCMkTrMdPx/y
         +DRYo1Dw1+zgxDcEgZB/ed7ojmwqhTqme4fs8WqqcNLyvdzHNMBJGjBggWsvayK2Hzdk
         JupTLHLdZpbk6q2De53Yrf4PzrPyctXPSO2Dbz+UOOtQgxYH6rlqVz0LRcUIxeNGhmTG
         v+5PporayHbaGRcABpguFhQzVdsM82CfVG0oJbCf4SqC1avy1620oqVuRWTLgiaOQok2
         wZPXhG7BNeLaTzlt+QwWVmZqITI2O5GtzrvGZt7xspQKt6cipCRmmtK1bzE005KJoEbl
         dJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794689084; x=1795293884;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RF5riISKB3U2P5GXHOTUJqXWoYoCQ7YYxFY6WjpFX3Y=;
        b=bG5V1TXRvWUmyST2WiT8Buktj0Bf9iEw6AC6fuE3od8A4kPShVg3CUtRhWUp7gMDB/
         IyWRot+/4GwXdXmtJeqiEl9I0Bl9thhmKzq3ykfbk/9JpZj06lIlDdM2ZzsKEBGGk5VD
         sHYq3ZoKEb6B81mchtKBX30iOB2Pze5cAzUET7I424SSN0hx4CFo0iBNWOATXryjRkCC
         9M3T4+i0w3/JHDjG22txF1D1f9I3McVpfRiVsQLU/5LirqpqSLg3Aj2/1lljQAKybcpL
         aP7xZZjYFHzRTAIBwXD6haYoqNGWVkjpXAuyiV/pxI+5/dEpkk36TF7tjIAoky25uqz1
         2ggA==
X-Gm-Message-State: APuU4Z+Zywddw3ROlonNcOtMhUs59oAvH1RaG/Y1xdNVZQjy5MEIOFkD
	8az3o1pX1vnTvjnHjj/qtxApkAekCBqLsDqqINiMKA/mF+o4Vem1QKapQcZfIDZJVA==
X-Gm-Gg: AYBFou1nyk56qZlc/mz5kmE/aKFz9jOA+wYiXWHJochw40jzTO31Y9564CPr8r0fPTv
	7p0UiPj0IUE0D/3mKeulNO4l6l9VF+JlQ0c8SekuNij2Ct8lo8IcxMMMCNJEqGP3NVtQYAKVLns
	G3i6Uu4vwyWN2BUvX8tuk1ItziDFWk7AK4RNIFf6XFFezejakHNEliXyB1eyxvhOC7rsa9vT3M8
	8E6ofPstmZyFDLaM0+2KAXcKfNMgCXHC4QCSZEFXGdy9skk39Rf2zaG3pJ14cG41YoxIyXPL3qm
	A7XkJs+who3XLGCqlw2AFwOZ/L8lomSC2urqnHinR+iGNy/dSVQXI2/ePNB6B01Jk10MoDIx/FB
	mw29im2ezM1GM0wz1ECVcLQWOLSnnSg+tKBMIWYvCF6Kzrf6xky1znn9eyqFAIfcYZ9lAUauSUU
	JDmSKIynj5/Ofzvcqw4QTnMSmbDbpUc5nQJ4Hvarx53CKWkRHNpRskmHsp85Jpp4qP03aEuYkax
	60hhXVxfwihdnfivxJPny88c/m+EsnIQBFiUQpp+w2J4Llpc5A30ztacmOJfKi0mhNO0LvvmokU
	DxZ7jSg0GIfNgJ7BLPctGQBe8NRpBw==
X-Received: by 2002:a05:622a:250a:b0:535:70b5:806 with SMTP id d75a77b69052e-55ac977d7b3mr99745041cf.62.1794689084098;
        Sat, 14 Nov 2026 12:44:44 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::d398])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad0534196sm47228031cf.9.2026.11.14.12.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 12:44:43 -0800 (PST)
Date: Sat, 14 Nov 2026 15:44:40 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Hongyu Xie <xiehongyu1@kylinos.cn>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	usb-storage@lists.one-eyed-alien.net,
	syzbot+30552b4cbe99d6d91306@syzkaller.appspotmail.com,
	Liu Qi <liuqi@longcheer.com>, stable@vger.kernel.org
Subject: Re: [usb-storage] [PATCH v5 0/2] usb-storage: bound the ene_ub6250
 probe-time card-type query
Message-ID: <9b81c4c1-998a-4dd9-a998-1605f4781dd8@rowland.harvard.edu>
References: <b07b5f5b-4722-4f1c-84b9-205ba9b8943f@rowland.harvard.edu>
 <20261113073638.1225998-1-xiehongyu1@kylinos.cn>
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
In-Reply-To: <20261113073638.1225998-1-xiehongyu1@kylinos.cn>

On Fri, Nov 13, 2026 at 03:36:36PM +0800, Hongyu Xie wrote:
> This is v5 of the fix for the ene_ub6250 card-type probe hang.  Changes
> since v4, following Alan's review:
> 
>  - Split the series: the transport helper comes first, the driver change
>    second.
>  - Drop the shared 10-second budget.  Each transfer now gets the full
>    timeout; a timeout at any stage fails the query immediately and the
>    query is bounded to about 50 seconds at most (five transfers),
>    without the remaining-time bookkeeping.
>  - Shorten the comment above ENE_PROBE_TIMEOUT, as the reasoning is in
>    ene_ub6250_init().
>  - Drop the unused initializer of the bulk pipe variable.
> 
> The transport helper is recorded as a stable prerequisite, so the
> dependency is available when the fix is backported.
> 
> The forward declaration of ene_ub6250_init() is still needed: the
> unusual-device table is generated by including unusual_ene_ub6250.h
> before the function definition and takes its address, so removing the
> declaration breaks the build ("'ene_ub6250_init' undeclared here").
> realtek_cr.c uses the same declaration for init_realtek_cr().
> 
> Testing: with the syzbot C reproducer, the unpatched kernel blocks in
> the probe for more than 143 seconds and the shutdown hangs; with the fix
> the probe fails after about 10 seconds with -EIO, before the SCSI host
> and the scan work exist, and the system shuts down cleanly.
> 
> Hongyu Xie (2):
>   usb-storage: add usb_stor_bulk_transfer_buf_timeout()
>   usb-storage: ene_ub6250: don't let the card-type probe hang forever
> 
>  drivers/usb/storage/ene_ub6250.c         | 110 +++++++++++++++--------
>  drivers/usb/storage/transport.c          |  31 +++++--
>  drivers/usb/storage/transport.h          |   5 ++
>  drivers/usb/storage/unusual_ene_ub6250.h |   2 +-
>  4 files changed, 102 insertions(+), 46 deletions(-)
> 
> -- 

For both patches:

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
