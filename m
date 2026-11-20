Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174451;
	b=ZtOCx24ZnI14zODLkkd8X+buQX4JRCMA3M8Kp1gKlqLhU6KpJNkkOrN7Fg8PV0/qwgAt
	 s01q5Kk7WX9GaNyco2hx/5xW2mvkQwAIzwpmSBRXm/+A4ayqAtpkDWrldO7w1PCWCRBC5
	 n7vendU38CJ64M7oynd1luvSB0FT88xlU8vB2UQLEgzKLZeGkVk/ADcHCDlXGEyivtOH6
	 H0y1ycFYol9RSvwKMZfU8SBViC2mTeleQWc3Kv3gqL0P1yjtPGu4cx7VotWH6KfEFOrMf
	 MAKUvzvENhZrxLzsSxZGWpXEKfpLmspfBDNt2n1aXLRurCcADosaq7whP9+ZnZO05jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=NcboF+7Ibrmdu8GyKDhEBakGgWL/6zJDq2Y724rkq5A=;
	b=1f8iMuvNolEM5GCr+NSRsuicYOa74xit3TDLblLbxZRgjXoHcacnm3PBzSLAHxUa1OHx
	 aaY+70H6iGGtFlfOMgGkr3gI/SWF+o4i6FfwPfm3yyox+goL4OpWnrh8/PXOZZoma32gS
	 uxCyZJTSWxF2vylBDjJwmMXh5D+pmc27n9iKojCrfPDWIToOlOfqYegClVJDm8fo6mgIB
	 jDJ9mU3BAFdccZo2Qkw+Ydw+4B88a+HRoDbvJlOrBgp84IwNZsqzD84/4VZ1Z7PgNb5B0
	 KgnEXza6boUglgVP+lgyz/mx4UtQSaMYUqo/OD8Fqi/8+Qqq35OpO+hqpep8jNyprXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fN1o8DTz;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D1E606A320
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 11:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94D1E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fN1o8DTz
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso398637a12.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 03:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795174451; x=1795779251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NcboF+7Ibrmdu8GyKDhEBakGgWL/6zJDq2Y724rkq5A=;
        b=fN1o8DTz8saUJXAI6UDM2wPcHyFeJeG8poNNyE4LnUesELXn51xESxwynt+UlGze3v
         zHG2oR2rTTiuoUX974exUvSPmUQQnNkydu72xnJu7SwhHh62M4i9rz1ctq+7nUbKbCl1
         Pe7toDAWmf+cm7p5rEi2XLL6qOF8nkcZWE1N6gWzLCLLmj7b67x05Wfhbqh2kiwasHwu
         J11Tfhp+rblssB8m3Qgm8W+7L5eCPyFQ6NZZW96aMCGPzHzCH8OTJ5OorYL3xvwPHdnF
         jDAtzG55BpDc29Qk0xk/RAab5uIcRcrIT0i/2rP3Y6up5LloZFot2JLWqnwonk9+6rzA
         7Jqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174451; x=1795779251;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NcboF+7Ibrmdu8GyKDhEBakGgWL/6zJDq2Y724rkq5A=;
        b=HHh/0hc37Tt9vF8fzj4J6Ny14/rfbHITajGmGDlpBPuZLfaAz8zefL1LbRI4OMyU4t
         UNi5Kp9FkWxl6wLLQtC8D7pKHiJOqc3XhBSbyhWIsVsaiLp+Rj8PdLBWVdAEP6ksOO1u
         6Nq4x1DfOmUTfPgQVLGj2mDB2PpuEBnAmJTWIturlwV/SjRuunHNWbb0xKTSdge2i8lr
         DPtMa1tIQkpFVgGBeg+TgvxKOl4+LStiw7OLciXhYKYwlAP33jYjyGxQPJx0AGKTZdTO
         0bQ1uhvZhKtAuZFf4HnxfM7pMJGOhDtno+YZ9e0yfNvmxiKczstbaAokIHSOe6o3s8PS
         +H/Q==
X-Gm-Message-State: APuU4Z/Qq0QSNEZjziau6L6o6kzCxuPOjJxfIQGKz90e/oVAEOxifrA1
	qTpzEDc2LDL8AlJhQYJifaz7FMF7QTSuz9ZGIW4YmDuKN8XkILK4s1WUYKY9JLXVHXU=
X-Gm-Gg: AYBFou3UT3CLGJjPfB+5tiiF0vS9HCu/JwUhXaRSOx+UtIOhmlrbI++bKj01Uo0DsxC
	J5jLCsm5SKTwimtRxLVO6mV40LW0vjkVSeBrDbdbDc2jL8SosnWwXC5bSyM6l0kN5mPs+jQyiqC
	EyGDC7r6LrNnJ3CXOCFN2XilpOgcCqG8gpBkDMPK+A1a5Xdn8mO1DXhoSGC1TCiRB151nEd2t4e
	SCyk1owIeOdNLeXZ0qbcywFoUlEGiyQwk92vMGeKRfoG300JA/8y6Q5WEI+f79pmVKqvxoP2xr3
	r1egWvwVKT5fDurxWGEi1FhPT2GZMpsxXNNo9L6QEF9gITyhJgEnkuHn7v4Xo5CbqK3m9yXgm+a
	VylcP2GYcOwKHavfDpVX1r054oZ78Fzy23h7efvV8vyZ4+FktyEh6iy2rt4fxdd4s4s2rJL/STp
	EeuMef22Oj5Mvhtc4wGDvLZK+75IyyehgnkbbSt68R0BG6ix8LpVGXXswKHQ1Iz76zL3UI3uFZH
	cPc+JgF0jX+uq52RtUbcok4z14LoOyD133RAU7cRvGu0gE0i/7Za5/vkYiYKq6582MlsqXKXHY/
	edBPukmd+2AZTmrD5VpHpX4qYkE/e+HyC9yBVwVObkrBdRa9gsTOpM8mOOhvYvmxnM3elS2kkqM
	+Hp/hN5saar8vxFinQBh75WZdFzj/6r+qC9LB
X-Received: by 2002:a05:6300:95:b0:3e2:b85c:4b2a with SMTP id adf61e73a8af0-4014ef51c4amr2831753637.73.1795174450911;
        Fri, 20 Nov 2026 03:34:10 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d06ee37sm1139702a12.28.2026.11.20.03.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:34:10 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/2] usb: gadget: f_tcm: fix a short write infoleak and a completion-path sleep
Date: Fri, 20 Nov 2026 20:34:02 +0900
Message-ID: <20261120113402.3069090-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013062129.2568405-1-yhlee@isslab.korea.ac.kr>
References: <20261013062129.2568405-1-yhlee@isslab.korea.ac.kr>
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

This is superseded by v8:
  https://lore.kernel.org/all/20261118124005.2428068-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
