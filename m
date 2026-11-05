Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793857868;
	b=c6htoGr0GNSXBpU7gc3l0nKW1dmnwsO084s2bXmy4pQpr+Rcv0GBudNJxF3FqitieUXp
	 J0yGh+a6/Llz1T2g1pY0gWuipMhS+AeQyinm5wkLkZqfxGPfh4X2OflaZYk92gIXRsnT5
	 c2aUoRndCVWJX2RT0/5p1NHGYkUv+4qRcgJc4HleykQJV+ad/k7FlDZQZAby6N44nzw2k
	 gp+HxXoqTh9rv3iuBxPtkGP3kIiseKbXQwq4HZy4s+2Sf52+wtxkrxn4tnKK2L/ix3SOk
	 JDL7RzQskRh2xgRFk6jy9utUk90lHpk1VLjVSeiLvjkFWZaPs7RwpnPOS6PWRy2Waeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793857868;
	h=DMARC-Filter:Received:From:Subject:Date:Message-ID:In-Reply-To:
	 References:To:Cc:Content-Type:Content-Transfer-Encoding:MIME-Version:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=8t6cnIqzRvx8r9CuKiTU07DXvChD1pSEZutAsmBOq/k=;
	b=OKN71nFCV/x+tOLOLxjXWnDLcCFTWVqs0/oC3oRK+Rlt5z79oYEP3392HugYhi4vk3lj
	 5L/JdgGWtc8yHjlVOsA3Lx35rWzOWqdWzE34o0o0oZJcRCgAAAzMqD6jltlxPtthsBN0k
	 oyF7CCAutV0RAfvhkz071Ml2owMt0E0Z+fdUM//FWwqzQVwzbGbc0bROCNUMYbqKVz4vy
	 oR9CxM2gWal/0WLP2KgGrWAhR2rN6Q+g/5xfNGW5lkxTVV9ccn75eAnd37BQvmEF6+ydX
	 aiH0eyxhj3ohSWaJCTaZ05+J8zuclMZUa3kFL0EemGWIHS0WIAhL8JbwTD3uvGHxQug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.81
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBE2606A31B
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 05:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BBE2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAC3xZY+GexqUEdTAA--.12394S2;
	Thu, 05 Nov 2026 13:50:54 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
Subject:
 Re: [PATCH] usb: cdnsp: drop runtime PM reference on gadget init failure
Date: Thu, 05 Nov 2026 05:51:03 -0000
Message-ID: <179385786361.1679257.17893284647338175920@iscas.ac.cn>
In-Reply-To: <d88f8e61-4549-4a10-8509-a59698b6dcd9@kernel.org>
References: <20261104021503.1468519-1-vulab@iscas.ac.cn>
 <aurm1tM212A8jOSk@hu-petche-lv.qualcomm.com>
 <d88f8e61-4549-4a10-8509-a59698b6dcd9@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Chen <peter.chen@oss.qualcomm.com>
Cc: Pawel Laszczak <pawell@cadence.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-CM-TRANSID:rQCowAC3xZY+GexqUEdTAA--.12394S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WFW3uw4xKFWxur1xArW8JFb_yoW8XFWkpF
	ZxKwn0yr9rAF1IvrsrZ3W8tFy0vayrGrWrJF98WryUAwn8Xw4IvrWvya18Z3W3W3Z3Gr4a
	vw4S93WkZF4YvaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvjb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxV
	W0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Cr1j6rxdMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCF
	04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWU
	twCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUqU
	GOUUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgYCA2rr-LFh5AAAsI

Hi Krzysztof, Peter, Greg,

I am very sorry for the consequences of these submissions. You are right
to question the safety of this patch and the way we have handled these
submissions. I apologize for the inadequate validation, the volume of
patches, and our failure to respond to earlier feedback. That has wasted
reviewers' time and damaged trust in our contributions. I take
responsibility for my submissions.

I want to state clearly that there was no malicious intent behind these
patches. Our intention was to fix bugs, and we did not intend to insert
security vulnerabilities or deceive reviewers. I understand why the
combination of potentially unsafe changes, repeated submissions, and
unanswered feedback raised this concern. Intent alone does not make an
unsafe patch acceptable.

We did use AI assistance, but the responsibility for understanding and
checking the changes remains with us. We should not have treated a
single local reference-counting change as sufficient evidence that a
patch was safe.

Once again, I am sorry for my actions, and I will do everything I can to
address the harm caused by these submissions. I promise to respect the
requested posting pause and will not send further batches during this
period. I will personally reply to all of the feedback I have left
unanswered over the past month or two. Until I have completed those
replies and received your permission to resume, I will not submit any
new patches. I hope you will give me the opportunity to make things
right.

Best regards,
Wentao Liang

