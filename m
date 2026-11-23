Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426035;
	b=iwMI5W5eVX2SneRNPch5lA+HHu57h1kTYQ6cPoLiD3DarMZTxgBW+k3hgLXlCYTBQ2+R
	 BnbWQaZlKt4oTbmPt0hJFCXEVk14qBrabDXb2AK/NLv+Z651ZuvtaDAsJ7eolx5mMBM53
	 orxJr0DK7fpKVP9bX0w82GXBzNtxEzUujNWrKph411KKOd3b0wN+LVZ8pg/+H/RrUna3U
	 CKlEEG4r8AHJ63VCZ39XViXjAg7s6yyfpoDZhQe4itKdbVd43DN1OkOnXoAAvBq/bONon
	 XoWOIGjcOp2+wVOJHl3UsFJmRfsDluADJvoOhmZ6ZJIPGfBdW9m0J9LLEqoeeFkfWFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426035;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ti+jiiYqKb/fJoked6vO8ZSZi7IUQ+nKa0N05q9OVjk=;
	b=jhLVwRFpaRojoOaKGMMsaEEgV93k9GgxcQmGyiFQn3mmH3RB4ghAoAeqtJf+TL8o96eV
	 9Tz5hXUuokT1F2RD/J9/nBBi8s4XD5GeIz/J9c4EORqijGJdFpjGx3kcU5p4BPOYu4fIZ
	 Fi3jfGq7FHQC0ISLTcjZ5jzjXTNRxrraO10Q/TCjtDH2+5bkbLEnytam4TCw2mMSoRk0o
	 lKWOtxnXghECU6zeCpmFYPaSZadkX6Rjd8OVd0TFb0/ns02glgRhzYAhbMhuenx7j5FXD
	 QJ+/2WqXKrllgWmT/pv/scwzGfhwsNYPR2W9nCaJ/q1oiFKBUBTNvBjfbEQjMNdol4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nU3bOcyK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1C7606A321;
	Mon, 23 Nov 2026 09:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nU3bOcyK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A5EB1F000CA;
	Mon, 23 Nov 2026 09:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795426035;
	bh=ti+jiiYqKb/fJoked6vO8ZSZi7IUQ+nKa0N05q9OVjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nU3bOcyKca/51xcJnkNERwuGkKnggiNMNd/wUd+XvfBV2pRoCFrMkikcjbOBFYS3Q
	 fBqME1gT2K5baPW7dG4/RjU8qE1GfJwy+5gKm0ue36koAdHZPV0oBLMhgobmP41RA+
	 MnzIU9/789ESMUsk3H5/ZbNjQkybKVCIEPdCE9jT9X8COYzpV7NCopvB0WgXaU3kxn
	 J5wmeYnDTAJx2wp83jLwiP26Lyvplbd+8EI4uqL+H36f54pOC2NEDJG10kH6yhh58T
	 GN/SPXe3kWgdikngRNa5whkRiJnPK+wOyS9uRO8MFzqThf9V+kJpWoYWCCQfHzYIO7
	 03KV2HhHmOIWw==
Received: from johan by xi.lan with local (Exim 4.100.1)
	(envelope-from <johan@kernel.org>)
	id 1xVQKO-00000007dVY-3xed;
	Mon, 23 Nov 2026 10:27:12 +0100
Date: Mon, 23 Nov 2026 10:27:12 +0100
From: Johan Hovold <johan@kernel.org>
To: "William A. Kennington III" <william@wkennington.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Oliver Neukum <oneukum@suse.com>,
	Havard Skinnemoen <hskinnemoen@google.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: cdc-acm: refuse writes after disconnect
Message-ID: <awQG8FhptjLFG21T@hovoldconsulting.com>
References: <20261118145636.3534234-1-william@wkennington.com>
 <awAtdlEpSLc1ges1@hovoldconsulting.com>
 <20261121081843.4065887-1-william@wkennington.com>
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
In-Reply-To: <20261121081843.4065887-1-william@wkennington.com>

On Sat, Nov 21, 2026 at 08:18:43AM +0000, William A. Kennington III wrote:
> On Fri, Nov 20, 2026 at 12:22:30PM +0100, Johan Hovold wrote:
> > Thanks for reporting this. I assume this is not something you actually
> > hit yourself but rather something flagged by an LLM?
> 
> We actually hit this twice in a kdump I got from a machine doing some
> usb reset testing. An LLM was used to squash the bug.

Thanks for clarifying.

Johan
