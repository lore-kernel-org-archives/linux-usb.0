Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D30D3AFD19
	for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2026 13:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782133439; cv=none; b=eyuhFi/W2y+nuCqOEw5vRqHOu9rYp8TbSzVv9jdrn44wmKjvk3VoLmJyNXPoudED6MPyiuk83Sec6pn2R6uhjTe01NPUuk8t4pI+g85ddIwHfj3usz30e/09MR6qOnO/ut72HBxghqs6QXZSdkgwXWS7Te5UZn+rfTnIhmG2L9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782133439; c=relaxed/simple;
	bh=ZWrnUmd4s1PGLsWmsZ0VBfx45QUJkGzVruaA75Xj70E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lHo2iHPrwVD7Nw2jq82u0vInZNkoRk6wJtg5JfRWsUpMPllONxzH/nyMPR5//b9D9IaI5Ops0iqdj5gyUmfQbhi8iHfdWsY0DW4iC9S6oa1IbFLuoxfxugNGQnyn4ZeK4R0Elzp7jQZt550ioWNIdE1uE4MAQN8b6d9wY3uIwC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Y8TOYgJT; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Y8TOYgJT"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4923fb1f095so31604925e9.1
        for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2026 06:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782133432; x=1782738232; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3hsVtpSsUNsx/k80Nk5sPLM4WST9qjS6SPhICLZMfjk=;
        b=Y8TOYgJTPUQMyJgv8i/CMPEXEWG7yGYg8JL7YKX++WGdOX1KBeHDzvK4NlA/Yf4XbR
         oQ63nxuBZqIwP4Fy3qIfv5S2el04/ZGZwgIuR2mCARKODTUUD6jQlxFJ+GioCVPk/51h
         yib/8TuSBPK8iWA9dNOYJ1wRHPU8bK8a+Lxibv6Bo+1Kce/eEzZbzD7axSNpEkygqrlk
         zU28Qk5gWSI8XYJGPGeBjUD3niJ18L4+rVlt9pOG4CWAFapU4O3zwOmMJTsGR1VX6l+h
         0/o6uHk2ADklHscQmPOAdyza/uI7VQ7qyw/OzZyTuMJfP6cocba/YUCrBYExafuTHGFD
         9uyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782133432; x=1782738232;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3hsVtpSsUNsx/k80Nk5sPLM4WST9qjS6SPhICLZMfjk=;
        b=Q86RZkbY94ywvXSe1SO80fp28XMlvNOfwekEagSM5FoTnh+/ffXmPQTDpMYef8Hgpg
         N/qPkSlpOhhswW7qwqm7oqvwUR6fdZVcPWVet43LcIOhtyuKhRd0COmmzdVHRiJtBuTb
         PXhMWrtzk78V2WJH7HjXiiizr5/2zwIWRsIlRTY65wGF4RutvN/Go2dHkaG2X+yypAGr
         cAeeTvMJv+Re5asSiyv+COQhINWolEINs2hCPEvVGRNMdTSW0KDPne5K78O0mf50eqU5
         zMXPzy4tpiG/1rnokH+wxk4em6Zj1YJ0khSfOPAYSc5Yl/zIxqLiu9sX0b6B4vodqcXM
         f54w==
X-Gm-Message-State: AOJu0YzLgEsv+QYFuU3QznP6/RaSit0St4SDzCAnyM7TM7SCDQ+X2SIY
	RTO42azMubM8pHunjN8wqNgDK4IwfRF7DdHKrTmXQN1LHnMcpPwXigkHHoJYjirXbyY=
X-Gm-Gg: AfdE7cmscPrCwctBPHQTrbwiBHsuA5fv1k6biWX6DSATPnOI/XUeMNFGatojupksf38
	ltULgdyagKNjGA6Jb1vl+B7lB2GagiC318CXsG2ufl3iokc8HNlQ/iyCa/DPpL+neYfWyilhjLR
	kRGI4199dt64h/OIklQHfp8gumH2T4SzFjQLcNM7t3QBInKULtdDmraxSXEV3jCEUVvCLSv9NcZ
	z9h4scWnZ66V3LGJNF228fFJvJpvcgDYjfUH+GNe4RpPWsf9GmQqrlhrhoD93yDzwzUaTr2sEt7
	57mGGpCg77ELLuRR+o5sw6a9zgVE9L7PySG/7+Hu8ZqjeVzfaBoMcWKpnRMxEhSMVg1xcfgqPT4
	OOcqBdSphyOeR9pbqEOtjfRolG5o0sEI7NsvRNE4Z4hHi2Apqbf+TSj6xTGLXumObsfo8z+OlYi
	B9BV/Csa+bBnWESGrpCnGx3RHI1Bo1MSqc/1JRh726c+QafPFnUeOyAKlA8biv9nmRyA==
X-Received: by 2002:a05:600c:4713:b0:492:4667:8c40 with SMTP id 5b1f17b1804b1-49246678e86mr166579925e9.8.1782133432322;
        Mon, 22 Jun 2026 06:03:52 -0700 (PDT)
Received: from ?IPV6:2001:a61:13d4:6901:78ed:1f08:f691:11a2? ([2001:a61:13d4:6901:78ed:1f08:f691:11a2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666c57ba0sm27430103f8f.32.2026.06.22.06.03.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 06:03:51 -0700 (PDT)
Message-ID: <2dfae761-581c-401e-9438-2b06aea82f23@suse.com>
Date: Mon, 22 Jun 2026 15:03:50 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: misc: usbsevseg: replace deprecated simple_strtoul
 with kstrtouint
To: Jad Keskes <inasj268@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260622125045.2398164-1-inasj268@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260622125045.2398164-1-inasj268@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 22.06.26 14:50, Jad Keskes wrote:
> simple_strtoul() is deprecated. kstrtouint() actually tells you when
> the input is garbage instead of silently accepting zero.

That changes the API visible to user space. Is this a good idea?

	Regards
		Oliver

