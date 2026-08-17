Received: from mail.amicon.ru (unknown [77.108.111.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225A342EEA1;
	Mon, 17 Aug 2026 15:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.108.111.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786981913; cv=none; b=YXBNqvFUJF81f/xg9z2R1Z2ihgbonyCDVuk8iIALWuyblUgBGC/E2OOayZMjD42+j/IK9phoAvrVfHnPZbTitr6kmJmgeqGB6b+2VrQQ+wFBa4CIoa21R+I8SosIqCFANHMY29sJGdwGPvvUriyIml6imzuDhLLMCmbEO8HfMVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786981913; c=relaxed/simple;
	bh=WivYQjAaaHcHeRELzRA+XpycdY5ndXfeOD8l2Tp/BaI=;
	h=Content-Type:From:To:CC:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version; b=p1vlMM6bpBcVFmJN5m4+gQ4Ll3uJ2KXebUSkvOpr+8WsyyVkeyLY0y8qbkQDr6ctnrPTBbYtVsZFxURdcoyHBhBJ2ylvb5nza84OypusYiqyBFhyLWKE2epnnHUZkhXL/SMuU6DZVGim5m7TjKl9DExv14wp1fmyb3sIsH9QuQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amicon.ru; spf=pass smtp.mailfrom=amicon.ru; dkim=pass (2048-bit key) header.d=amicon.ru header.i=@amicon.ru header.b=oPpt3gUd; arc=none smtp.client-ip=77.108.111.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amicon.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amicon.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amicon.ru header.i=@amicon.ru header.b="oPpt3gUd"
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; d=amicon.ru; s=mail; c=simple/simple;
	t=1786981904; h=from:subject:to:date:message-id;
	bh=WivYQjAaaHcHeRELzRA+XpycdY5ndXfeOD8l2Tp/BaI=;
	b=oPpt3gUdOlbUdZlSBwLpD2accsS3LzB12WMsi+RCwmg/8n+AeHVwcsQLdNVereLAGhgFwx7RG7s
	7MiVFFBaIghy/WfDbAbXnFrPa2CyGD30Gj4dpLpyeuVxBJPdDmV4v+ggx/gaHMeaEN51fHtWFwMSO
	idNlS76vh9rHpUBngFBB/9yGbXKAsJrJs8Pm/Sw2PVpuA+UNgG6g2u3TquD3ZfJM1u+gcM3ZTVleu
	jp5xxsXBqOehx2GqD0bmfUDsDJ2fX3FLXNSaBf7JRRrkQTYICShJSj5jAS/TKl+WT6XztlXo6qXev
	oEQSmf2nJDqFiQjDtqY37Bavbiy9nlcFYM2w==
Received: from dish.amicon.lan (172.16.30.10) by mail.amicon.lan
 (192.168.0.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.27; Mon, 17 Aug
 2026 18:51:44 +0300
From: Daniil Iskhakov <dish@amicon.ru>
To: <dish@amicon.ru>, Johan Hovold <johan@kernel.org>
CC: <ade@amicon.ru>, <gregkh@linuxfoundation.org>,
	<linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<lvc-project@linuxtesting.org>, <rrv@amicon.ru>
Subject: Re: [PATCH RESEND] USB: serial: mos7720: fix actual baud rate not reported back to TTY
Date: Mon, 17 Aug 2026 18:53:24 +0300
Message-ID: <20260817155324.2514473-1-dish@amicon.ru>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715142234.53046-1-dish@amicon.ru>
References: <20260715142234.53046-1-dish@amicon.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: mail.amicon.lan (192.168.0.59) To mail.amicon.lan
 (192.168.0.59)

Hi Johan, Greg,

Gentle ping on this patch. It's been over a month since the resend.

Could you please take a look when you have a chance?

Thanks,
Daniil
