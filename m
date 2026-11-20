Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201011;
	b=ojE/qzY0aw7YiebLlOTxYSKp35Vm+dyuiJYXhd0hBNT5TH1e4eikKTU4zqwXVdUZPbmj
	 LxEu7xG2v1MYox2R8vmaC5bHHTiOIPWkzqWwdZUOaW10+HPLccDpyBeIDA10MECxCDAoM
	 TVKOzlZst1sJ3s3kh5pAq4Cxw465QkdPmLWdUMDuxpFJQFU0iPJDnf0kYPnZ5rjRIDK0i
	 yBR+3VnqXymjnqUWQ8Ir+4jmAnWkNFKAFhNvb3SCMbj2L/jGvN+4kUH/r8sS+FO0k86zl
	 drNJi1FTw5xbMM9sd4hJEh2M2ViZwFqOQMpC+Rdc7Aaz8jqaMUW4rLuJz8GXotny7lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=MbVQtId4GZJpOwZIgQ5IVkC1l8C9teB2jkENg0QieKg=;
	b=5lVWgbp2lfHdoLUyYan6nBl9ll5JQia0xWhYDM46vNjh31Hr4TCh0sHPh53PTetpMa3+
	 u6Q/Lisk+C6lG7z6OKpNPQoBvTRKh6OjABbpDEYld/Ex9DoaHwftwT3fsLixLvxkOgrXf
	 vokiaKP/kh+n7a+SbPT/9qM1IfsgghpU2HfuuqcHJlOaFoJ75TikhUcm7gk0G0EhjElpm
	 VWVgPK2GQ4oUMFiQrCBmF7z6AtHTYBMXzC170t9sBB1QRwKOMF5mUGhUySW+1PoIAdrfR
	 PBqWAiv/9DgTgY0k/3G4COTA5r7vlJ/DsAE1zhv5LzmWFhUJ1JcCPKYXuUWYsyzvgrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r8GQQw9t;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65CF60A2604
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 18:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A65CF60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r8GQQw9t
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b5e5e64494so817653b3a.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 10:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795201010; x=1795805810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MbVQtId4GZJpOwZIgQ5IVkC1l8C9teB2jkENg0QieKg=;
        b=r8GQQw9tdT3JOh+6FNwiH/8laGLkVWuAdVc6z6ZwV4kBuFi5o/1q6BThpy4rU7X1fs
         TuK8QuWm48oz7IzcriEy8yV3tCvCGN1QU+PjHPwsmFaGHK5OaevpI6Nb7PPxNiq1mr4b
         a+Zg3dqp2LZSApuR250ogcTr0aMkngN70Rx1h8Jlyoa62yEbl5Vkh2BneroA7at+k3PT
         zHec/Y8bHDpQ8Kc9ETuh1CXi/orZMal93vpieAuHFLGBDnqhMgwzs5FOZ7eVUk/aa7/k
         zEWIBoX4cdB/pxY8WqnwBjGOw7lmI38HIYIujaik8O7UAtopthj4VpCZm4/bqwtefwVL
         ft7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201010; x=1795805810;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MbVQtId4GZJpOwZIgQ5IVkC1l8C9teB2jkENg0QieKg=;
        b=XyYCLsCkADOG/+FuyQIZx5c49x3+K7Vhdykd6UBvxNDR9wZXZ0n/+5O2AEj1tH8ST8
         5tVjiFuT39Z5DOJGxRPRV81K/G+tqJMjbWfW7DxyEeACIu+7Mn5d3lbV3U41FPl32pFY
         nUckcZ4rE9hsSXpvoqibsUXYg2f9j80YAZtZ1EOaFr9tjKeLBPUJOEEQc+/1JEhzM2to
         skCuYBl0gbvdUXHjDQUN8/qJBVAiOIRM5Pg5V7+mmKNEAmbkai0LfjmpXVaUyFO+VP4p
         aZaWWNGmnGdq30xmhIfR5SB7zdXj9igLUgpzQCEr5MLQnIKheZWdmdquJQBEFDKOJq5X
         WgEQ==
X-Forwarded-Encrypted: i=1; AL+hErFEKiFzttk/sQWO1inh+l+Q6d9MhNScjYD6zki9bK9xFmG2W7QuFZstZMdp0tmWHS3nXTkAYMAV56A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+83uUEfr0/pJwIVDYZV22+ioSiHgMdCd8218mR8/s9TiN/Nati
	w0AgbVqIXmogH7jweFWLmh61yxjx70awO9/nQeQtfi5PXoNbkb8wPx8N
X-Gm-Gg: AZFdTZd0gxMmkOQSdDM4Q3F/pTJ6CEmuxFL3GEkOwW/oiat706hxzqZwisTh+bWbvel
	K3eCXQlPgtu049ShNGVlVG9PmXoobSCXKZ7IMGaRU73OK/vG4axTwrbCoNBF8ZBjmBqdC14VsYS
	d02G2BDuW78rZ1/VRm+zQIQyA+EEiVoDlXcaevD+sqH3o0wAQsVbdpv6g5J4OibHVN/fUMWdyTW
	IsVO27MP3wdAfNoRrVqIfTEL4L3XK8kcfYxF5rqAbtyD5TS9CNwGm12Eiz+EY96WdhWC10iehEN
	RnHAiyhkso/rx0uq8pUxtHXe4ZLUTSqP+52Vbs/v2niuDDgV0XLdsP+RJG/3pMwTIDrU2NuwQD8
	AqhzPiXF4scV9+VJyaFh24RZswbheTcpjXJCxt1Ai7CdjfWL4JIX8g+ToiVcHW2oMbORSBvHSMM
	rBsIYKsrXbHCfmEd8lnQ1HeeiYgLSJUbPC+Yg8Re9wo/8te3AkDj1vIRcYj605UqaYo3zxm6/sn
	mWLx5dSAcR178ZSbufcVbO8706MY0AB4vCwtA1aaAR0heZSQ/Nty3sBKPUKCrKrPSwtP0V4KWnF
	zpgr6DnSrRFaBnDkH9kZKxMG8wCRnuTK9eI2dg==
X-Received: by 2002:a17:90b:3c11:b0:3a6:f1d2:57f3 with SMTP id 98e67ed59e1d1-3b41c97bc96mr3964802a91.58.1795201009657;
        Fri, 20 Nov 2026 10:56:49 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([2001:e60:8509:ba6c:ade5:705a:60d1:a474])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d639fdsm8484216a91.10.2026.11.20.10.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:56:48 -0800 (PST)
From: joonhoekim <26rote@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Joonhoe Kim <26rote@gmail.com>,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	heikki.krogerus@linux.intel.com,
	abel.vesa@oss.qualcomm.com,
	abelvesa@kernel.org,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	effeffe99@gmail.com,
	prashanth.k@oss.qualcomm.com,
	yongxing.mou@oss.qualcomm.com,
	peter.chen@oss.qualcomm.com,
	tapas.rana@oss.qualcomm.com,
	vkoul@kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] usb: dwc3: qcom: Use the UTMI clock as PIPE clock in DisplayPort-only modes
Date: Sat, 21 Nov 2026 03:56:42 +0900
Message-ID: <20261120185642.1188-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <2026112017-flyover-grape-cee7@gregkh>
References: <20261119124558.1548-1-26rote@gmail.com> <20261119124558.1548-3-26rote@gmail.com> <2026112017-flyover-grape-cee7@gregkh>
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

From: Joonhoe Kim <26rote@gmail.com>

On Fri, Nov 20, 2026 at 04:07:21PM +0100, Greg KH wrote:
> > -static void dwc3_qcom_select_utmi_clk(struct dwc3_qcom *qcom)
> > +static void dwc3_qcom_select_utmi_clk(struct dwc3_qcom *qcom, bool utmi)
>
> What does that bool mean? That's going to be a pain, please make this 2
> functions so you know what is happening when you call it.

Will do in v5: dwc3_qcom_select_utmi_clk() stays as it is upstream, and
a new dwc3_qcom_select_pipe_clk() goes back to the PIPE clock.

> > +	mutex_lock(&qcom->pipe_clk_lock);
>
> Why no guard() use here?

v3 used guard() and scoped_guard() for this lock. Krzysztof preferred
plain mutex_lock()/mutex_unlock() where nothing returns early [1], so I
changed it in v4. I'll go back to guard() for this lock in v5, unless
Krzysztof objects.

[1] https://lore.kernel.org/all/20261113-artificial-quixotic-firefly-84baef@quoll/

Thanks,
Joonhoe Kim
