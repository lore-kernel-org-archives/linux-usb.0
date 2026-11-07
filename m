Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794017528;
	b=gYxlbRAdXQuTLjVj6XWdOhDfQG3w8tI/zu8Qe0DSNO4cxZmp9kBDDeFXGRKwulIFcvLm
	 Jy3OSsYElgyUe2JCDFjMUfVtBpzyDo+uaxJ1NrZYD8J5gUd1BKCn7ljedKgW0aLuGnKwV
	 45xO1PRcPaf1ImuifK+6PPXF/It0vROMUjxv9Mi5TkaGM+eokPwxYfIfhIzlJ+q1YHPt+
	 XOlpG9t3n8grscYDmIhilR0mbrls9+kjHWOUguAt14eQ69ZGzGnJ5DKotXIyrqsvhosKT
	 wvx2FRinJL9VOGVQv1aMqweSN0AvTr/GJfyGGl1vutiYOFNbropOi+zFWH+puSxpqQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794017528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=LqQCtL7DY6GdOgcgju6Yk99vFFUh6YCcWxgQrEusl0c=;
	b=2yDK87hosBjihuR4SsHcfAQUTnDY0IZCG2G6jojXkxxD+jPnqkh9pGyuIm5CBn768sos
	 gegw8XU9MkB2vRrUyLUqGggHCsvYW6OyLAibJHx+n3IQuDawZZyipmkV21uyOBANziMe7
	 gqP2epcOSg1kVSX1rCNgpSZfQ8U1O7TrO/d+BjK+rraRYRsaybiD2Me/KgYJwqaLb4PPi
	 xIF/N3W4Lp27dSyxv0btD/n5h8cs6haQriIL3G4O9i35kJsW5w38g3OHjBLwRqBV2/zAL
	 pwH0ENF13ClQ9jU2PtZwsCJM/lv7wg7Jhv0+VIRVbHyMiG+JEB7izVOMTW+mqwrRsUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WN40mK77;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE1C606A32E
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 02:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BE1C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WN40mK77
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36dbde64409so1710914eec.0
        for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2026 18:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794017527; x=1794622327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LqQCtL7DY6GdOgcgju6Yk99vFFUh6YCcWxgQrEusl0c=;
        b=WN40mK77q2MS0NRynvOXOkwBOhjMjS8o5blvaF59gy/8znq9HbxNHxZsG2N1FwWOAO
         pTAuQRf4j6rhw3fT56835TqbRRFGlf/OQ3XNQZH/24t0RcQ8PVTrF64PbPQ1y3uhItZS
         0AIFwC+b6KLahtXWBc/L05PucbM1u78pW1i9Z/K6mqbGrDf5V41efbftNnhbCqtO58zk
         k/1bSUUBNsdi0Vp5tTaO57CUdgE29Uu6dA/R+TbEbxV5nQ4DpIrV2buafwtFjBoOUH8g
         syYT0OEWfsXI/cMn9aePHWmEpAeIyyTaImStZlRs0dwx0NklaqtHGIkst0IwuM8aMobz
         tGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794017527; x=1794622327;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LqQCtL7DY6GdOgcgju6Yk99vFFUh6YCcWxgQrEusl0c=;
        b=zfwZC1Xl2wvRPI9H9IWhycWSIprD3CbkNg9dIl2mTbaCT2lUhL80WxxuGCyyhT5Jrh
         z/F2RghRznWPpnaf5SbcMItY9vBA4NErzHwF5JZHkXpWlqq2dhBOaUTtXE7kBGuqF51N
         Sxi8gxwa3RCtJ8djkC1zGXpAbC7HJPKhuZ71G8MOiey+bZaef299FHjvY+v/jb/6E2jz
         8klsiq1nn/Ckd2tn3+obkH8WRTIw2VtnjHbWXk0VCNCOziQJfKJosLU1YTwoj19lj2pU
         wCFEfsaaGKcM07dPMY4k3P9kriwRC1BhYE+ib3DHw22PYtqCK71RQG63Xbu4eH/xcSsc
         pxcg==
X-Forwarded-Encrypted: i=1; AKwUvBzfcdN4X4nZHocsDYZlv4aDWYz7WnRfTnLfHEfxtrkF2robjIjyjXm/O9KYAQxwdj7bJEiGpUb4vnY=@vger.kernel.org
X-Gm-Message-State: APuU4Z84i4pPbAhwz8LQ2UmLmsJYf5nH5U2ScCBfrndkjyN3cmMRZOAF
	0FhqfKHzHKlNCjgfHuVrdYgOv8l+SnFO6wSwO2f3HOQsrL5wZCHaLYBe/n6cmCWoMwlfww==
X-Gm-Gg: AYBFou0C+/jLq5R9Nu93edeqvWFkdoug/586MPgKiH/BO9rC2bEjd94JHyjCi5wqPkM
	yXp0y871/Nvsm82mvuFD4UU62fbEiTQ4kn4LuPBZIrQnQeSMQdtS9Gk6uzJC3+tlEoofQQPaFqY
	nt/ZOE75xttydRZauT2zekLeDOdfYijUD7Yp8sZWW/s78iG74Roz1PgSh/4JNIuanpfkY06Lgqt
	duV24a6xuvlKjZf6X5rbh1YXjvo3LHqcAOZYhNJ0+VtkUUFOxS4h2gelVllAQLED7EQVu5xLWXw
	JpbkINrEkMvhESpLEQskhza1Kf4XfyLHDiS3PiAqDbEgbCMBYGTGq8SDP4N7bG0p8aCr+XQ+0vP
	7Cv2gxoEpHgg+z/l8d26A91kg/5TZ9elfTeX3XXWYfeWBFLMZOrx2d6DmYzuPqWh/OP2jW6c/Uv
	uNA5S5ev7C4+pTttFUoUx6m5dWqzsSjGd8reEbn5w4Ip6wTcVIO1BNdL905eS+HD9ILL2MTY2he
	xsJo8ACevXezgFR7+Wk4EuAkGUS2a89r8Qy2p1FVKAMmP4o4/0TuqcNbKYZEBapmDDcHtKGRUNW
	xNthXEF8mkg1tfI5nIA4ZSqaNQstCzhPQ00QH4DQ3+vf
X-Received: by 2002:a05:7301:b0c:b0:36d:c3db:9802 with SMTP id 5a478bee46e88-36f76023a2cmr5537963eec.18.1794017527249;
        Fri, 06 Nov 2026 18:12:07 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9be7077sm10949924eec.17.2026.11.06.18.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:12:06 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Val Packett <val@packett.cool>,
	Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>,
	Vladyslav Tymoshchuk <tvlad744@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: qcom,snps-dwc3: Add mode-switch
Date: Sat,  7 Nov 2026 11:12:08 +0900
Message-ID: <20261107021208.934-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261104-bipedal-supportive-earwig-2aae26@quoll>
References: <20261103135057.1682-1-26rote@gmail.com> <20261103135057.1682-2-26rote@gmail.com> <20261104-bipedal-supportive-earwig-2aae26@quoll>
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

On Wed, Nov 04, 2026 at 02:13:21PM +0100, Krzysztof Kozlowski wrote:
> On Tue, Nov 03, 2026 at 10:50:55PM +0900, Joonhoe Kim wrote:
> > The QMP USB3-DP combo PHY stops the USB3 PIPE clock when a Type-C
> > DisplayPort pin assignment gives it all four lanes for DisplayPort,
> > while the controller can keep running its USB 2.0 port. The controller
> > has to move to the UTMI clock before that happens, so it needs the
> > Type-C mux state as well. fwnode_typec_mux_get() only matches graph
>
> Controller does not perform the switch, does it?

No, it does not route any signals. It only needs to know the mode: in
pin assignments C and E it selects the UTMI clock as its PIPE clock
before the PHY stops the PIPE clock.

usb-switch.yaml describes mode-switch as "Possible handler of altmode
switching". The WCD939x codec uses it in a similar way: its mux
callback only reports the audio accessory mode to its headset
detection. The codec nodes in sm8650-qrd.dts and sm8750-mtp.dts have
mode-switch.

> > nodes that have the "mode-switch" property, so allow it on the
> > controller node.
>
> So judging by this, you would need to fix fwnode_typec_mux_get() or
> opther driver code, not the binding?

The binding is needed because typec_mux_match() checks this property
before the mux driver has probed (see the comment in typec_mux_match(),
drivers/usb/typec/mux.c). Without that check, any graph neighbour that
is not a mux would make fwnode_typec_mux_get() return -EPROBE_DEFER
forever.

Apple and Rockchip handle this in the PHY driver, because there the PHY
driver can reach the controller-side USB3 control (the Apple PIPE
handler, the Rockchip USB GRF). On Qualcomm the clock
select is in the dwc3 glue (QSCRATCH), so the alternative would be a new
interface for the QMP PHY to notify the controller. I found no existing
one. It would have one advantage: the PHY knows when it actually
switches. I can try that if you prefer it.

> > +  mode-switch: true
>
> Drop, but you might explicitly disallow orientation and retimer, if
> entire solution stays after review.

OK. v3 will keep the usb-switch.yaml reference, drop this line and set
orientation-switch and retimer-switch to false.

Thanks,
Joonhoe Kim
