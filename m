Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893148;
	b=dAyv8fKSgHoTHg3kRnqBSDBGb4ybu5CnwUTHLmAI/viABzrwfRsp7atNNAcaXUcmISR1
	 3tBM82UyiqapphN8/YWpzz7j4bx7ukpqmW3b8/a3DSnermuFFHqvLBTe7MNufpEZfYhiz
	 seisbp9TsQ0wpo6rXbp9dG/GohgdLPqCkuwuk8+nUNQtJj1LBz2j1Y2XXZhvf5LzE/ccY
	 5Vnj10xNrq4GuEFucZw5HACCkYVodK4x2f4N1Cz3A2Q8NbRxCWCt27p7Mf4JGXjs7vZX5
	 B8P2czbkbfGmiy23n2iu6IOkYQGDgHnAjOYvIdesjwBHsvItBk75n8xzgUMoHERVbog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8JkfHiQEMtf0YYgXubzDg94vF7YvHDx8RH2S+gQfkvI=;
	b=e6kZ/XOcIe3iPH1N5NXy3462uZp7OMgCNHH+DQcZcD2UoDCdZ6opiu2v2cWPLpBlgkkr
	 4W0fkepR/mlq4oFECYzF5DyY+iiZkBy5sbsS6dJStpNK9ybTrtvOGl3GtBei20Nbzh8lR
	 E+33TQrFO7tWpteTNyJYbHUPiJFNPyAxW+YrPfzryHIed+53SHBA7k/M4LvxisSH1yAVI
	 LcR13Cw2JHHwiXGOH1TplgD5gED5SIiWH4D7VuzCcDKvO6g66DCU76kaH52A0ecKug3/Y
	 ri8lybFJGyxpkN0rBaQQ+vwUQK98Q0IVUS28rDr7O7RDkrHAmOkt5dVSC2thS56V08A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=VsxxJdLL;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474F7606D80A
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 15:39:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 474F7606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=VsxxJdLL
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93e55db58cfso212373285a.1
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 07:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793893147; x=1794497947; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8JkfHiQEMtf0YYgXubzDg94vF7YvHDx8RH2S+gQfkvI=;
        b=VsxxJdLLlfPOOtPonUHzniELq44+vkwx2NhzVYM+d/WiKtYn1rc2Dj9j860sK/BKYk
         vpoSTrlRbE1PuFq7yuccJcNQWfi3mzALQrIhPdBLpEJMBXoLnnMuwCq6vobOqzbGWQ5k
         hAIakt+aLJly0qKi/N4qCYMeUPnESlQTcefTHdav0DabkQpiBVclMiVRKw1mENC5bpXm
         HJcafXEvWzVgl8Rridpjy7bYk8xywjNJIjWqBD79E+fiCCRpg8lUQE+E1kOdznRdNqxK
         AsWa9Et5UIK66lV6BZ0MpPbkNGp9h3RzLJKoVMImgAstaLxHgCjJ/wbAh4b66Q9oG2x7
         MTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793893147; x=1794497947;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8JkfHiQEMtf0YYgXubzDg94vF7YvHDx8RH2S+gQfkvI=;
        b=Ory9Gzg2Km+konGnMTQusROorpyD/p5dDKVdwrA2n75rkWgkLS4fjIBnkh0GOsyHsl
         duAv+BvZjOcJN70f3PaMBSEcQNXGn8ciTQr+QyG0oCsnjvdlj6R741XSoeRk/rl1knQO
         v3PnSqHUF43Mk876sRHNPKhCpoMtGho3ohtwG6rOzSqe6V2bCS/m5Gm0VCOF/zB1X8pr
         ftn8NMDcJklAaVfM6JR0NM55gKxqCLeK9z8BZE88KX/Tqrh0KyAYM4kDLUtGnnm65Jx+
         k6fF1AwHyqExOD+aIJwlzanOtc9TUvyHlweVTWAYDtSZ/UqdKE6kxIsdOHDA0/DgQDwr
         ILow==
X-Forwarded-Encrypted: i=1; AKwUvBxueJeNNTOAwdDlFkFijXwasSAtzXen7KcfCYuO3XHh1ynO5S8y2yCc2lWCFnCi0IvS+ec20hc1bEk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nDn7CNOYj3/9UAO3R3BgtOwXTQGwNZCPtT33vG+8uwdYqLNsX
	XcELrUatGibokQH59yPZ3fgp+oK3XJDh7A6BBNybmIZxWoL/Txxvs+hKOkIeU3zdFg==
X-Gm-Gg: AYBFou1J9MFNkGjSeUEvHfFRImDLAsK6y8J9R8Tsp/xt6tZ5F5+0oRagsmMDaBPWD7g
	8mqdLJIjYTxY8ydGqRHCdtUlNShQe+A3dwQYCN9zRHB2JjEtWjkBTNpiqeiV3bZie6AMNCv+zx8
	tf7nd0BtsSI1sJif60/upj74m0MU5pi9P9qJMvB5f1SpfKnQ0O9bTJ/LEJ6Xjsn53fv44A5xtb9
	znB8vSeHVzmtsZz2v28TcZ+sxiZc2wg7vojphr9Jq50C3jFuSAINZ7owu4R0MhZ7PEGevW/LroT
	v0S21u3NsIkeHvacBnsWkFfOmIciAfUknyBUVNi91nGDaHQUj4ECkh4D1OOHVam52fEdTdNsLhQ
	ACRJvHBmdvnQNgQQBTBiQpG5GQKsB3EjGoOcA6WFf1fbS02WMKpN/oC8ReFliakwXRvTBY/fslb
	EAokggu0/q1w2UaHRnS15Pb5fbXxlzCYhBzw6wF/TMfxrPt2tJcey+KZ/AroCBo8LeKpmT8aWm6
	RxcWvS8dwG0V0xS0VMuQM40vHTjyCHTHmoXIdZaWbpxjcGeF8Bzes9cpqMe3V+v/wFsUJXtY2Ng
	6M91gceWzuTm3qoRb4ZeP9SwbbGW
X-Received: by 2002:a05:620a:618e:b0:93c:6e1d:96b4 with SMTP id af79cd13be357-944217b4de9mr2981549885a.62.1793893147067;
        Thu, 05 Nov 2026 07:39:07 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d485a5fdsm488893285a.34.2026.11.05.07.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:39:06 -0800 (PST)
Date: Thu, 5 Nov 2026 10:39:03 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: YuanZhe Liu <25031212351@stu.xidian.edu.cn>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Bin Yu <byu@xidian.edu.cn>,
	Cheng Wen <wencheng@xidian.edu.cn>
Subject: Re: [PATCH v5] usb: xhci: Fix use-after-free race in
 xhci_stop_device()
Message-ID: <a6a3adbc-bab2-4047-b417-5faff738f59e@rowland.harvard.edu>
References: <20261104000031.679944e7.michal.pecio@gmail.com>
 <20261104035637.3325-1-25031212351@stu.xidian.edu.cn>
 <b8ea2f8f-ff9e-4cc6-853b-114fe51173e6@rowland.harvard.edu>
 <20261104175949.71804650.michal.pecio@gmail.com>
 <d7448504-a63e-4f3a-a828-7656b1084105@rowland.harvard.edu>
 <20261105085238.337cb70c.michal.pecio@gmail.com>
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
In-Reply-To: <20261105085238.337cb70c.michal.pecio@gmail.com>

On Thu, Nov 05, 2026 at 08:52:38AM +0100, Michal Pecio wrote:
> > I suppose we could check that there are no errant URBs still in
> > progress just before putting the port into suspend, but is this
> > really necessary?
> 
> It's already being done, looks like those drivers aren't *actually*
> trusted very much. But there is the ep0 loophole.

Well, we can always add a check for ep0, just before the actual suspend.

Alan Stern
