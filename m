Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795496066;
	b=l6VtvfwWh6Pmc+HbNXWYhXJ/eV5u0i5+F87JiBIpUl7eg61aGYx5LWrUo++2OFy/VRJi
	 GVgn/04JGer10bm8Auuouoy4llVmyQEDBQcA85OoC7KLv4JZW2Ke7dCaTi9YN6qxY4Nns
	 m5yq48zmDFdPknnTSJja7Usgr9Kh3z6BWkuvP2LlsmSXIiM/4GDFk2Nppl2jV2pOXHwWS
	 XbuGFmdH47VpboQS3VGSakiLhZDQ4DNvsFKHfa8PyBKMTiNJkbOSUa9Io+LC7v9zFklip
	 xHThtCnNorygEU03XaTbPNdcTb/ZF0gvTG1mmsCV0CqXR+MadI9gJmGEdvAzzRQepoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795496066;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=lmcKUpb35ZyL107tc2LlJIvptvkEIXtUu3NUrpkThDY=;
	b=IslOzzUd9ka2NEUSvm0nV5I1u1YSzl74xnJxVoiWZ4D65ZizXSAEs/k9QZehOnJiVhKb
	 LI3wgjDrla93wB4OtsI5tdZuZuMJrmzFVg0PjGxd5JlxRMQiF+R/TIXQuQHnEJw2UDRgO
	 DhS4vtSmNX7JJIMMPI2A8eR0nqZTaseUMVu22JaXmOKicreIeYwjGSIQFGkFHYDzb5iKi
	 TQZZ4Eexn4nqSLVn87VxPdP+GFupxO1GZQm5YHVm3UpoPN/ANqqXDCCTEyO82hWu33jBu
	 WTjHnQqQxq+SuBda6ZmOsHWpO+dAR74ezZJ8zUcZ7tMZ9B2JsdyViM3397bl/N07aYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=ikRd7CHy;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DCA2606A327;
	Tue, 24 Nov 2026 04:54:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DCA2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=ikRd7CHy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=lmcKUpb35ZyL107tc2LlJIvptvkEIXtUu3
	NUrpkThDY=; b=ikRd7CHyQYXmn2JpWHFb38Fjxm1V+SDMnmb4Dc6J+KY06ZA/q0
	0YYpTj6dC/qRcal63RHmevCwUwm0QV/UKxNd2sdx+ve8uFHQ5mbryonK/iT4UncC
	X4y5APlgbYJ1m6G6BsVqg1rR9GoMrTySK8FKZWJ+nUqLr+LiM5hr+WDkE=
Received: from xuqianhui.tail7a2807.ts.net (unknown [114.214.185.179])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgDHU0h8GAVr1xrwAA--.388S2;
	Tue, 24 Nov 2026 12:54:20 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: dmitry.torokhov@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v14 0/3] usb: dwc3: support two connectors sharing one HS data bus
Date: Tue, 24 Nov 2026 12:54:20 +0800
Message-ID: <duplicate-notice-1@local>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124045220.595001-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261124045220.595001-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:3pYKCgDHU0h8GAVr1xrwAA--.388S2
X-Coremail-Antispam: 1UD129KBjvdXoWrAryfWr1Duw4xAF43JrWxtFb_yoWxGFg_Wr
	W8AryDCw1DJFsFkanFyr12vanrCw4jkFyYqr92yr12qryxZ393XwnFkw45tr93t3y8WrZa
	kF1DZayUury7ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbIAYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l
	c2xSY4AK67AK6r45MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
	0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
	tVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcV
	CY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE
	14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyT
	uYvjxU45rcDUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREBB2sElFst2AA7s4

Hi all,

Please ignore this thread.  v14 was already posted earlier today
(cover <20261124015002.1426767-1-xiaqinghuan@mail.ustc.edu.cn>,
archived on lore); the copies under
<20261124045220.595001-1-xiaqinghuan@mail.ustc.edu.cn> are a byte-identical
accidental re-send caused by an automated local session that misread the
posting state.  Nothing differs between the two postings; treat the
earlier thread as the series of record and review that one.

Sorry for the noise.

Best regards,
Qianhui Xu

(Prepared with the help of an LLM coding assistant; the author takes
responsibility for the content.)

