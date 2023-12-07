Received: from mail11.truemail.it (mail11.truemail.it [IPv6:2001:4b7e:0:8::81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC7DAA8
	for <linux-usb@vger.kernel.org>; Thu,  7 Dec 2023 02:03:53 -0800 (PST)
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 8BCCD1F842;
	Thu,  7 Dec 2023 11:03:49 +0100 (CET)
Date: Thu, 7 Dec 2023 11:03:45 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Oliver Neukum <oneukum@suse.com>
Cc: Hiago De Franco <hiagofranco@gmail.com>,
	Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
	davem@davemloft.net, edumazet@google.com, hiago.franco@toradex.com,
	kuba@kernel.org, linux-usb@vger.kernel.org, pabeni@redhat.com
Subject: Re: Question regarding CDC NCM and VNC performance issue
Message-ID: <ZXGYgfFhVhlprqco@francesco-nb.int.toradex.com>
References: <2ce653b3-c553-457f-bcbf-9fce36f82dff@suse.com>
 <20231206162353.53767-1-hiagofranco@gmail.com>
 <c2ee0ecf-993e-4736-b005-588fa6ef51a3@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2ee0ecf-993e-4736-b005-588fa6ef51a3@suse.com>

Hello Oliver and Maciej

On Thu, Dec 07, 2023 at 10:41:51AM +0100, Oliver Neukum wrote:
> On 06.12.23 17:23, Hiago De Franco wrote:
> > From: Hiago De Franco <hiago.franco@toradex.com>
> > On 06.12.23 13:21, Oliver Neukum wrote:
> > > Before we proceed, however, your patch raises a fundamental question:
> > > Are we talking about gadget or host mode here?
> > > Could you please describe your setup in detail?
> > 
> > Sure, I'm running a Apalis iMX6QD 512MB, which is basically an ARM 32-bits
> > device with NXP iMX6QD. This device is running Linux with wayland, weston
> > and the neatvnc server, so I can access my app using a vnc client on my
> > host PC (also running Linux, Debian 12).
> 
> OK, you are using Linux on _both_ sides. Interesting, far from obvious, though.
> (Putting Maciej into CC)

One more data point. If the USB host side is Windows and not Linux it
works fine.

Francesco

